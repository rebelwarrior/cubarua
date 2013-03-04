# Projecto de HackPR: RUA (Registro Único de Agencias) API 

## Descripción:

Esta es una implementación en Ruby y Cuba del API (Application Protocol Interface) de RUA (Registro Único de Agencias) de Puerto Rico. Es una copia de programa creado por rosarior en [github] (https://github.com/rosarior/rua) implementada en Ruby, Cuba y Active Record para darle mas agilidad y velocidad al las respuestas. La base de datos es sqlite3 pero se puede cambiar en production.

## Uso:
Instalar ruby primero (sugiero usar [RailsInstaller](http://railsinstaller.org/) para Mac & Windows. Asi tiene tambien el database y todo lo necesario.)

Este programa depende de las siguientes 'gems': 
 
*  cuba,  
*  activerecord,   
*  sqlite3,    
*  rack-contrib,  
*  shotgun

(Incluí un Gemfile pero no lo he provado, para usarlo utilize: `$bundle install`)

Despues de instalar los 'gems' necesarios simplemente:  
  
 `$shotgun`


## Todavia por hacer:
1. Verificar JSONP funciona.
2. Igualar el API con el original de Roberto