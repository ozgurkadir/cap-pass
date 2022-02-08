namespace cap.pass;

using {
    managed,
    cuid
} from '@sap/cds/common';

entity PassItems  : managed, cuid
{
    description : String;
    password : Binary;
    username : String;
    uri : String;
    note: String;
}
