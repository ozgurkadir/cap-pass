namespace cap.pass;

entity Items
{
    key ID : UUID @Core.Computed;
    description : String;
    password : LargeBinary;
    username : String;
    uri : String;
    note: String;
}
