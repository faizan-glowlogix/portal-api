<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;

class UserController extends Controller
{
    use ApiResponser;

    public function index()
    {
        $users = User::all();

        return $this->success($users,'All Users Data',200);
    }
}
