/*Couldn't Upload "Daily_Practice/Day20_(1).xlsx" and "Resources\1500000 Sales Records.csv" due to size exceeding 100 MB */
let
    Source = Csv.Document(File.Contents("Resources\1500000 Sales Records.csv"),[Delimiter=",", Columns=14, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Region", type text}, {"Country", type text}, {"Item Type", type text}, {"Sales Channel", type text}, {"Order Priority", type text}, {"Order Date", type text}, {"Order ID", Int64.Type}, {"Ship Date", type text}, {"Units Sold", Int64.Type}, {"Unit Price", type number}, {"Unit Cost", type number}, {"Total Revenue", type number}, {"Total Cost", type number}, {"Total Profit", type number}}),
    #"Changed Type with Locale" = Table.TransformColumnTypes(#"Changed Type", {{"Order Date", type date}, {"Ship Date", type date}}, "en-US"),
    #"Changed Type1" = Table.TransformColumnTypes(#"Changed Type with Locale",{{"Unit Cost", Currency.Type}, {"Unit Price", Currency.Type}, {"Total Revenue", Currency.Type}, {"Total Cost", Currency.Type}, {"Total Profit", Currency.Type}})
in
    #"Changed Type1"