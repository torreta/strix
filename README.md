Strix Demo
=========== 
### Welcome! Have a quick read of this 
 
hi, this is a showcase made to impress my coworkers, it might not be much, but it was meant to be simple and explainable so
i could make a quick look of rails benefits, also, i will try to merge a couple of another technologies to show the potencial 
of the tool. 

if u get confused, just ask XD (those next line are there to remember me how to write markup language)
 
> ## How to make it run or test at least 
>  1. Clone the git project, or download it, however you want 
>  2. Get into the project folder via command terminal (did you unzip it, right?) 
>  3. Run ` gem install rails-api` (if there’s a problem here, you should check if ruby is installed) 
>  4. Run ` rbenv rehash`  (well, maybe those last two weren’t not really necessary...) 
>  5. Run `  bundle install`  
>  6. Run ` rake db:create` (just in case...) 
>  7. Run ` rake db:migrate` (at this point, if nothing has exploded, we are fine XD) 
>  8. Run ` rake db:seed` (just populating the database a little bit) 
>  9. Run ` rails server` (now, everything should be ready to test on localhost:3000) 
> 
> ## anything special you should know?  
> * this API renders no views, so don’t look for them 
> * API calls are made RESTFULL way (keep reading eventually I will describe the endpoints of the API) 
> * there’s two ways to access the API services, via ` http://localhost:3000/api/v1/<resource>` or ` http://localhost:3000/<resource>` 
> * keeping the track of the last point, api/v1/ requires no **token** via headers to give service, just so you can test the calls 
> * since there’s a lot of URL calls, you can use **Postman** (a chrome application) to help you keep track 
> * if you got postman, there’s an import file called `Postman_examples` in the project root to help you out testing with examples 
> * most GET call can return both .xml and .json formats but will return json by default if not specified 
> * the API responds with json to most calls, or http headers on most unsuccessful cases 
> 
 
Well, if you are curious about which App is this API giving service, check:  [link to_app_rep](https://github.com/torreta/CourierApp). 
 
Endpoints Overview 
------------------ 
 
  It may sound weird but, since calls on ` http://localhost:3000/<resource>` require a validation token, here’s the way to obtain it... 
   
  POST   ` http://localhost:3000/api_key` with header values on the call "email" and "password", you can use the default email: 'example@gmail.com' and password:'12345' 
 
### Resources  
   `/api/v1` actions: **index**, **create**, **show**, **update**, **destroy** 
    
- Agencies  
* Users   
- Packages 
+ Rates 
* Api_key (create, destroy) 
* Prices (not actually a resource, but it calculates the cost of a package) 
 
Endpoints Specifics 
------------------- 
 
>## Agencies 
> 
> **Verb**   **URI Pattern** 
> - *GET* 
>    * `/api/v1/agencies(.json,.xml)` 
>    * **success**: *status*: *ok*, return all agencies on the specified format 
>    * **error**: *status:  bad_request*, blank page 
>    * `/api/v1/agencies(.json,.xml)` (search by phone) 
>    * **params**: `phone:string`  
>    * **success**: *status*: *ok*, returns the agency found 
>    * **error**: *status:  not_found*, blank page 
> - *POST*                                                                                                  
>    * `/api/v1/agencies` 
>    * **params**:`name:string, phone:string, address:string` 
>    * **success**: *status*: *created*, return the *json* of the created object 
>    * **error**: *status*: *unprocessable_entity*, blank page 
> - *GET*                                                                                                            
>    *  ` /api/v1/agencies/:id(.json,.xml)` (:id, is the index of the *created* object) 
>    * **success**: *status*: *ok*, return the *json* of the specified entity 
>    * **error**: *status*: *bad_request*, blank page 
> - *PUT* / *PATCH* 
>    *  ` /api/v1/agencies/:id ` (:id, is the index of the *created* object) 
>    * **params**:`name:string` / `phone:string` / `address:string` 
>    * **success**: *status*: *accepted*, return the *json* of the updated object 
>    * **error**: *status*: *bad_request*, blank page 
> - *DELETE*     
>    *  ` /api/v1/agencies/:id ` (:id, is the index of the *created* object) 
>    * **success**: *status*: *accepted*, black page (the object was deleted) 
>    * **error**: *status*: *no_content*, blank page (no object to delete) 
> 
 
>## Rates 
> 
> **Verb**   **URI Pattern** 
> - *GET* 
>    * `/api/v1/rates(.json,.xml)` 
>    * **success**: *status*: *ok*, return all rates on the specified format 
>    * **error**: *status:  bad_request*, blank page 
> - *POST*                                                                                                  
>    * `/api/v1/rates` 
>    * **params**:`creator_id:integer constant:decimal K_value:decimal ` 
>    * **success**: *status*: *created*, return the *json* of the created object 
>    * **error**: *status*: *unprocessable_entity*, blank page 
> - *GET*                                                                                                            
>    *  ` /api/v1/rates/:id(.json,.xml)` (:id, is the index of the *created* object) 
>    * **success**: *status*: *ok*, return the *json* of the specified entity 
>    * **error**: *status*: *bad_request*, blank page 
> - *PUT* / *PATCH*        
>    *  ` /api/v1/rates/:id ` (:id, is the index of the *created* object) 
>    * **params**:`creator_id:integer`/` constant:decimal`/ `K_value:decimal ` 
>    * **success**: *status*: *accepted*, return the *json* of the updated object 
>    * **error**: *status*: *bad_request*, blank page 
> - *DELETE*     
>    *  ` /api/v1/rates/:id ` (:id, is the index of the *created* object) 
>    * **success**: *status*: *accepted*, black page (the object was deleted) 
>    * **error**: *status*: *no_content*, blank page (no object to delete) 
> 
 
>## Users 
> 
> **Verb**   **URI Pattern** 
> - *GET* 
>    * `/api/v1/users(.json,.xml)` 
>    * **success**: *status*: *ok*, return all users on the specified format 
>    * **error**: *status:  bad_request*, blank page 
>    * `/api/v1/users(.json,.xml)` (search by email) 
>    * **params**:`email:string` 
>    * **success**: *status*: *ok*, return the user found 
>    * **error**: *status:  not_found*, blank page 
>    * `/api/v1/users(.json,.xml)` (search by cedula) 
>    * **params**:`cedula:string` 
>    * **success**: *status*: *ok*, return the user found 
>    * **error**: *status:  not_found*, blank page 
> - *POST*                                                                                                  
>    * `/api/v1/users` 
>    * **params**:`email:string password:string role:string cedula:string name:string lastname:string phone:string` 
>    * **success**: *status*: *created*, return the *json* of the created object 
>    * **error**: *status*: *unprocessable_entity*, blank page 
> - *GET*                                                                                                            
>    *  ` /api/v1/users/:id(.json,.xml) ` (:id, is the index of the *created* object) 
>    * **success**: *status*: *ok*, return the *json* of the specified entity 
>    * **error**: *status*: *bad_request*, blank page 
> - *PUT* / *PATCH* 
>    *  ` /api/v1/users/:id ` (:id, is the index of the *created* object) 
>    * **params**:`email:string`/` password:string`/` role:string`/ `cedula:string`/` name:string` /`lastname:string`/` phone:string` 
>    * **success**: *status*: *accepted*, return the *json* of the updated object 
>    * **error**: *status*: *bad_request*, blank page 
> - *DELETE*     
>    *  ` /api/v1/users/:id ` (:id, is the index of the *created* object) 
>    * **success**: *status*: *accepted*, black page (the object was deleted) 
>    * **error**: *status*: *no_content*, blank page (no object to delete) 
> 
 
>## Packages 
> 
> **Verb**   **URI Pattern** 
> - *GET* 
>    * `/api/v1/packages(.json,.xml)` 
>    * **success**: *status*: *ok*, return all packages on the specified format 
>    * **error**: *status:  bad_request*, blank page 
>    * `/api/v1/packages(.json,.xml)` (search by sender_id) 
>    * **params**:`sender_id:integer` 
>    * **success**: *status*: *ok*, returns the all packages of the specified sender 
>    * **error**: *status:  not_found*, blank page 
>    * `/api/v1/packages(.json,.xml)` (search by receiver_id) 
>    * **params**:`receiver_id:integer` 
>    * **success**: *status*: *ok*, returns the all packages of the specified receiver 
>    * **error**: *status:  not_found*, blank page 
>    * `/api/v1/packages(.json,.xml)` (search by sender_agency_id) 
>    * **params**:`sender_agency_id:integer` 
>    * **success**: *status*: *ok*, returns the all packages of the specified sender agency 
>    * **error**: *status:  not_found*, blank page 
>    * `/api/v1/packages(.json,.xml)` (search by receiver_agency_id) 
>    * **params**:`receiver_agency_id:integer` 
>    * **success**: *status*: *ok*, returns the all packages of the specified receiver agency 
>    * **error**: *status:  not_found*, blank page 
> - *POST*                                                                                                  
>    * `/api/v1/packages` 
>    * **params**:`sender_id:integer receiver_id:integer sender_agency_id:integer receiver_agency_id:integer status:string dispatched_at:datetime delivered_at:datetime lenght:decimal width:decimal height:decimal weight:decimal value:decimal` 
>    * **success**: *status*: *created*, return the *json* of the created object 
>    * **error**: *status*: *unprocessable_entity*, blank page 
> - *GET*                                                                                                            
>    *  ` /api/v1/packages/:id(.json,.xml)` (:id, is the index of the *created* object) 
>    * **success**: *status*: *ok*, return the *json* of the specified entity 
>    * **error**: *status*: *bad_request*, blank page 
> - *PUT* / *PATCH* 
>    *  ` /api/v1/packages/:id ` (:id, is the index of the *created* object) 
>    * **params**:`sender_id:integer`/` receiver_id:integer`/` sender_agency_id:integer`/` receiver_agency_id:integer`/` status:string`/` dispatched_at:datetime`/` delivered_at:datetime`/` lenght:decimal`/` width:decimal`/` height:decimal`/` weight:decimal`/` value:decimal` 
>    * **success**: *status*: *accepted*, return the *json* of the updated object 
>    * **error**: *status*: *bad_request*, blank page 
> - *DELETE*     
>    *  ` /api/v1/packages/:id ` (:id, is the index of the *created* object) 
>    * **success**: *status*: *accepted*, black page (the object was deleted) 
>    * **error**: *status*: *no_content*, blank page (no object to delete) 
> 
 
>## Token Request 
> 
> **Verb**   **URI Pattern** 
> - *POST*                                                                                                  
>    * `/api_key` 
>    * **headers**:`email:string password:string` 
>    * **success**: *status*: *created*, return the *json* of the created object 
>    * **error**: *status*: *unauthorized*, blank page, invalid user 
>    * **error**: *status*: *bad_request*, blank page, possible header problem 
> - *DELETE*     
>    *  ` /api_key/:id ` (:id, is the index of the *created* token) 
>    * **success**: *status*: *accepted*, black page (the object was deleted) 
>    * **error**: *status*: *no_content*, blank page (no object to delete) 
>    * **error**: *status*: *unauthorized*, blank page (no object to delete) 
>    * **error**: *status*: *no_content*, maybe token was expired (no object to delete) 
> 
 
>## Pricing 
> 
> **Verb**   **URI Pattern** 
> - *GET*                                                                                                  
>    * `/price` 
>    * **params**:`lenght:decimal width:decimal height:decimal weight:decimal value:decimal` 
>    * **success**: *status*: *ok*, return the cost of the package in *string* 
>    * **error**: *status*: *bad_request*, blank page 
> 
 
>## With token auth 
> 
> **Applies all the routes mentioned before, but these are on the routes** `/<resource>`**and requires, the additional header** *token* **that you** *Obtain*,**making a** *token_request* **explained before, applies on all request except on price, for that API route**  
> 
> 
>## Version V1 
> 
> **you can refer to the specific document of API endpoints via  `/api/v1`, have fun!!** 
> 
>## License 
> 
> **Ruby on Rails is released under the [MIT License.](http://opensource.org/licenses/MIT)** 
> 
