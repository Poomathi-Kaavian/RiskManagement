using RiskService as service from '../../srv/risk-service';

annotate service.Risks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : 'Mitigation',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Priority',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Impact',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : bp_BusinessPartner,
            Label : 'Business Partner',
        },
    ]
);
annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
        ],
        Label : 'Mitigation',
    }
};
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Risk Overview',
            ID : 'RiskOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Risk Details',
                    ID : 'RiskDetails',
                    Target : '@UI.FieldGroup#RiskDetails',
                },],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Mitigation Overview',
            ID : 'MitigationOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Mitigation Details',
                    ID : 'MitigationDetails',
                    Target : '@UI.FieldGroup#MitigationDetails',
                },],
        },]
);
annotate service.Risks with @(
    UI.SelectionFields : [
        prio_code,
    ]
);
annotate service.Risks with {
    prio @Common.Label : 'Priority'
};
annotate service.Risks with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    }
);
annotate service.Risks with @(
    UI.FieldGroup #RiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title}',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Owner}',
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : 'Description',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : PrioCriticality,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataField',
                Value : bp_BusinessPartner,
                Label : 'Business Partner',
            },],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #Mitigation : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #Mitigation1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #MitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : 'Mitigation',
            },{
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : '{i18n>Owner}',
            },{
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : '{i18n>Timeline}',
            },],
    }
);
annotate service.Risks with {
    miti @Common.Text : {
            $value : miti.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Risks with {
    miti @Common.ValueListWithFixedValues : true
};
annotate service.Mitigations with {
    ID @Common.Text : descr
};
annotate service.Mitigations with {
    owner @Common.FieldControl : #ReadOnly
};
annotate service.Mitigations with {
    timeline @Common.FieldControl : #ReadOnly
};
annotate service.Risks with {
    prio @Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Risks with {
    impact @Common.Text : prio.code
};
annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
annotate service.BusinessPartners with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
annotate service.Risks with {
    bp @(
        Common.Text : bp.FullName,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BusinessPartners',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : bp_BusinessPartner,
                    ValueListProperty : 'BusinessPartner',
                },
            ],
            Label : 'Business Partner',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.BusinessPartners with {
    BusinessPartner @Common.Text : FullName
};

