namespace cap.pass;

using {
    managed,
    cuid
} from '@sap/cds/common';

entity PassItems  : managed, cuid
{
    description : String;
    password : LargeBinary;
    username : String;
    uri : String;
    note: String;
}
