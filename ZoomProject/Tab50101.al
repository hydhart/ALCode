table 50101 "Zoom Line"
{
    fields
    {
        field(1;"PK Value";Text[250])
        {
        }
        field(2;"Field No.";Integer)
        {
        }
        field(3;"Source Table"; Text[30])
        {
        }
        field(4;"Field Name";Text[30])
        {
        }
        field(5;"Field Value";Text[250])
        {
        }
    }

    keys
    {
        key(PK; "PK Value", "Field No.")
        {
            Clustered = true;
        }
    }
}