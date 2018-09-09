<?php

namespace App\Promocodes;

use App\Promocodes\Models\Promocode;
use Carbon\Carbon;

class Promocodes
{
    /**
     * Generated codes will be saved here
     * to be validated later.
     *
     * @var array
     */
    private $codes = [];

    /**
     * Length of code will be calculated from asterisks you have
     * set as mask in your config file.
     *
     * @var int
     */
    private $length;

    /**
     * Promocodes constructor.
     */
    public function __construct()
    {
        $this->codes = Promocode::pluck('code')->toArray();

        $this->length = substr_count(config('promocodes.mask'), '*');
    }

    /**
     * Generates promocodes as many as you wish.
     *
     * @param int $amount
     *
     * @return array
     */
    public function output($amount = 1)
    {
        $collection = [];

        for ($i = 1; $i <= $amount; $i++) {
            $random = $this->generate();

            while (!$this->validate($collection, $random)) {
                $random = $this->generate();
            }

            array_push($collection, $random);
        }

        return $collection;
    }

    /**
     * Save promocodes into database
     * Successful insert returns generated promocodes
     * Fail will return empty collection.
     *
     * @param int $amount
     * @param null $reward
     * @param array $data
     * @param int|null $expires_in
     *
     * @return \Illuminate\Support\Collection
     */
    public function create($amount = 1, $reward = 0, $number_uses = 1, $type = null, array $data = [], $expires_in = null)
    {
        $records = [];

        foreach ($this->output($amount) as $code) {
            $records[] = [
                'code'        => $code,
                'reward'      => $reward,
                'data'        => json_encode($data),
                'expires_at'  => $expires_in ? Carbon::now()->addDays($expires_in) : null,
                'number_uses' => $number_uses,
                'type'        => $type,
                'status'      => 1,
            ];
        }

        if (Promocode::insert($records)) {
            return collect($records)->map(function ($record) {
                $record['data'] = json_decode($record['data'], true);
                return $record;
            });
        }

        return collect([]);
    }

    /**
     * Check promocode in database if it is valid.
     *
     * @param string $code
     * @param string $uID
     *
     * @return bool|\Lanhktc\Promocodes\Model\Promocode
     */
    public function check($code, $uID = null)
    {
        if ($uID != null) {
            //if have value customer id
            if (!$uID) {
                return json_encode(['error' => 1, 'msg' => "error_uID_input"]);
            } else {
                $uID = (int) $uID;
            }
        } else {
            //Check user  login
            if (!auth()->check()) {
                return json_encode(['error' => 1, 'msg' => "error_login"]);
            } else {
                //user id current
                $uID = auth()->user()->id;
            }
        }

        $promocode = Promocode::byCode($code)->first();

        if ($promocode === null) {
            return json_encode(['error' => 1, 'msg' => "error_code_not_exist"]);
        }

        if ($promocode->number_uses == 0 || $promocode->number_uses <= $promocode->used) {
            return json_encode(['error' => 1, 'msg' => "error_code_cant_use"]);
        }

        if ($promocode->status == 0 || $promocode->isExpired()) {
            return json_encode(['error' => 1, 'msg' => "error_code_expired_disabled"]);
        }

        $arrUsers = [];
        foreach ($promocode->users as $value) {
            $arrUsers[] = $value->pivot->user_id;
        }
        if (in_array($uID, $arrUsers)) {
            return json_encode(['error' => 1, 'msg' => "error_user_used"]);
        }

        return json_encode(['error' => 0, 'content' => $promocode]);
    }

/**
 * [apply description]
 * @param  [type] $code [description]
 * @param  [type] $uID  [description]
 * @param  [type] $msg  [description]
 * @return [type]       [description]
 */
    public function apply($code, $uID = null, $msg = null)
    {

        if ($uID != null) {
            //if have value customer id
            if (!$uID) {
                return json_encode(['error' => 1, 'msg' => "error_uID_input"]);
            } else {
                $uID = (int) $uID;
            }
        } else {
            //Check user  login
            if (!auth()->check()) {
                return json_encode(['error' => 1, 'msg' => "error_login"]);
            } else {
                //user id current
                $uID = auth()->user()->id;
            }
        }

        //check code valid
        $check = json_decode($this->check($code, $uID), true);

        if ($check['error'] === 0) {
            $promocode = Promocode::byCode($code)->first();

            //users used code
            $arrUsers = $promocode->users()->pluck('id')->all();
            //if user not use
            if (!in_array($uID, $arrUsers)) {
                try {
                    $promocode->users()->attach($uID, [
                        'used_at' => Carbon::now(),
                        'log'     => $msg,
                    ]);
                    // increment used
                    $promocode->used += 1;
                    $promocode->save();
                    return json_encode(['error' => 0, 'content' => $promocode->load('users')]);
                } catch (\Exception $e) {
                    return json_encode(['error' => 1, 'msg' => $e->getMessage()]);
                }

            } else {
                return json_encode(['error' => 1, 'msg' => "error_user_used"]);
            }
        } else {
            return $this->check($code);
        }

    }

/**
 * [redeem description]
 * @param  [type] $code [description]
 * @param  [type] $uID  [description]
 * @param  [type] $msg  [description]
 * @return [type]       [description]
 */
    public function redeem($code, $uID = null, $msg = null)
    {
        return $this->apply($code, $uID, $msg);
    }

/**
 * [disable description]
 * @param  [type] $code [description]
 * @return [type]       [description]
 */
    public function disable($code)
    {
        $promocode = Promocode::byCode($code)->first();

        if ($promocode === null) {
            return json_encode(['error' => 1, 'msg' => "error_code_not_exist"]);
        }
        $promocode->status = 0;
        $promocode->save();
        return json_encode(['error' => 0, 'content' => $promocode->save()]);
    }

/**
 * [enable description]
 * @param  [type] $code [description]
 * @return [type]       [description]
 */
    public function enable($code)
    {
        $promocode = Promocode::byCode($code)->first();

        if ($promocode === null) {
            return json_encode(['error' => 1, 'msg' => "error_code_not_exist"]);
        }
        $promocode->status = 1;
        $promocode->save();
        return json_encode(['error' => 0, 'content' => $promocode->save()]);
    }

    /**
     * Here will be generated single code using your parameters from config.
     *
     * @return string
     */
    private function generate()
    {
        $characters = config('promocodes.characters');
        $mask       = config('promocodes.mask');
        $promocode  = '';
        $random     = [];

        for ($i = 1; $i <= $this->length; $i++) {
            $character = $characters[rand(0, strlen($characters) - 1)];
            $random[]  = $character;
        }

        shuffle($random);
        $length = count($random);

        $promocode .= $this->getPrefix();

        for ($i = 0; $i < $length; $i++) {
            $mask = preg_replace('/\*/', $random[$i], $mask, 1);
        }

        $promocode .= $mask;
        $promocode .= $this->getSuffix();

        return $promocode;
    }

    /**
     * Generate prefix with separator for promocode.
     *
     * @return string
     */
    private function getPrefix()
    {
        return (bool) config('promocodes.prefix')
        ? config('promocodes.prefix') . config('promocodes.separator')
        : '';
    }

    /**
     * Generate suffix with separator for promocode.
     *
     * @return string
     */
    private function getSuffix()
    {
        return (bool) config('promocodes.suffix')
        ? config('promocodes.separator') . config('promocodes.suffix')
        : '';
    }

    /**
     * Your code will be validated to be unique for one request.
     *
     * @param $collection
     * @param $new
     *
     * @return bool
     */
    private function validate($collection, $new)
    {
        return !in_array($new, array_merge($collection, $this->codes));
    }

    /**
     * Check if user is trying to apply code again.
     *
     * @param $promocode
     *
     * @return bool
     */

}
