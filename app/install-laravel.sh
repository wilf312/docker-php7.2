#!/bin/bash
composer global require laravel/installer
PATH=$PATH:$HOME/.composer/vendor/bin/
export PATH
laravel new
composer require predis/predis
