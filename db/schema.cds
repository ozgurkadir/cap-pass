namespace cap.pass;

entity PassItems
{
    key ID : UUID @Core.Computed;
    description : String;
    password : LargeBinary;
    username : String;
    uri : String;
    note: String;
}
