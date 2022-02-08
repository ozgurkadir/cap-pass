using { cap.pass as capPass } from '../db/schema';

@path : '/passItems'
service ItemsService @(requires: 'admin'){
  entity passItems as projection on capPass.PassItems;
}



annotate ItemsService.passItems with @(UI : {

    Facets              : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#prjFGrp',
        Label  : 'label 2'
    }

    ],

    HeaderInfo          : {

        TypeName       : '{i18n>project}',
        TypeNamePlural : '{i18n>projects}',
        Title          : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description,
        },
    },

    FieldGroup #prjFGrp : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {
            $Type : 'UI.DataField',
            Value : username,
        },
        {
            $Type : 'UI.DataField',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Value : uri,
        }
        ],
    },

    Identification      : [{Value : ID}],

    SelectionFields     : [
    username,
    description,
    ],

    LineItem            : [
    {Value : ID},
    {Value : description},
    {Value : username},
    {Value : uri}
    ]
});
