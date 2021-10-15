<?php

namespace App\Http\Controllers;

use App\Mail\LoginMail;
use App\Models\User;
use App\Services\MagicLinkService;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\Request;
use Illuminate\Routing\UrlGenerator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
        ]);


        $user = new User();
        $user->name = $validatedData['name'];
        $user->email = $validatedData['email'];
        $user->save();


        return response()->json([
            'user_id' => $user->id,
        ]);
    }
    public function generate(Request $request)
    {
        $user = User::where('email', $request['email'])->firstOrFail();

        $magicLink = new MagicLinkService($user);

        $magicLink->setRedirectUrl('http://portal.test/validate-token');

        $url = $magicLink->generate();

        Mail::to($user->email)->send(new LoginMail($url));

        return response()->json(['url' => $url, 'email' => 'Login request received please check the email'], 200);
    }

    public function check($id, Request $request, UrlGenerator $urlGenerator)
    {
        if (!$request->hasValidSignature() || !$urlGenerator->hasCorrectSignature($request) || !$urlGenerator->signatureHasNotExpired($request)) {
            throw new AuthorizationException;
        }

        $user = User::findorFail($id);

        return redirect($request->redirect_to . '?token=Bearer ' . $user->createToken('api')->plainTextToken . '&user=' . $user);
    }
}
