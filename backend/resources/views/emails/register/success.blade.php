@component('mail::message')
# Olá, {{ $user->name }}

Seu cadastro foi realizado com sucesso! <br>
Clique no botão abaixo para confirmar.

@component('mail::button', ['url' => ''])
Confimar
@endcomponent

Obrigado,<br>
{{ config('app.name') }}
@endcomponent
