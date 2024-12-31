using { PurchaseOrder } from './external/PurchaseOrder.cds';

@path : '/service/PurchaseOrderSvcs'
service PurchaseOrderService
{
    annotate A_PurchaseOrder with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'Viewer' ] }
    ];

    annotate A_PurchaseOrderItem with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'Manager' ] }
    ];

    @readonly
    entity A_PurchaseOrder as
        projection on PurchaseOrder.A_PurchaseOrder
        {
            PurchaseOrder,
            CompanyCode,
            Supplier,
            PurchaseOrderDate,
            AddressCityName,
            AddressFaxNumber,
            AddressHouseNumber,
            AddressName,
            AddressPostalCode,
            AddressStreetName,
            AddressPhoneNumber,
            AddressRegion,
            AddressCountry,
            to_PurchaseOrderItem : redirected to PurchaseOrderService.A_PurchaseOrderItem
        };

    @readonly
    entity A_PurchaseOrderItem as
        projection on PurchaseOrder.A_PurchaseOrderItem
        {
            PurchaseOrder,
            PurchaseOrderItem,
            Plant,
            OrderQuantity,
            NetPriceAmount,
            Material,
            DeliveryAddressID,
            DeliveryAddressName,
            DeliveryAddressName2,
            DeliveryAddressFullName,
            DeliveryAddressStreetName,
            DeliveryAddressHouseNumber,
            DeliveryAddressCityName,
            DeliveryAddressPostalCode,
            DeliveryAddressRegion,
            DeliveryAddressCountry,
            DeliveryAddressDistrictName
        };
}

annotate PurchaseOrderService with @requires :
[
    'authenticated-user'
];
