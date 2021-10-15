<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\URL;

class MagicLinkService
{
    public $user;
    protected $routeName = 'magic-link';
    protected $routeExpires = 30;
    protected $redirectUrl = null;

    public function __construct(User $user) {
        $this->user = $user;
    }

    public function generate()
    {
        return URL::temporarySignedRoute(
            $this->routeName,
            now()->addMinutes($this->routeExpires),
            [
                'id' => $this->user->id,
                'redirect_to' => $this->redirectUrl
            ]
        );
    }

    public function setRedirectUrl(string $redirectUrl)
    {
        $this->redirectUrl = $redirectUrl;
    }
}
