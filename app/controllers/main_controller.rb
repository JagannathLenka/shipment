class MainController < ApplicationController
  def index
    shipment = ShipmentDetail.new
    shipment.shipment = 'Shipment'
    shipment.shipment_type = 'ASN'
    shipment.shipment_carrier = 'Fedex'

    render :xml => shipment.to_xml

  end
end
