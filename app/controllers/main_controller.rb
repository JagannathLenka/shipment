class MainController < ApplicationController
  require 'nokogiri'

  protect_from_forgery except: [:index, :create]

  def index
    shipment = ShipmentDetail.new
    shipment.shipment = 'Shipment'
    shipment.shipment_type = 'ASN'
    shipment.shipment_carrier = 'Fedex'

    render :xml => shipment.to_xml

  end

  def create

    xml_data = Nokogiri::XML(request.body.read)

    shipments = []

    shipment = ShipmentDetail.new
    shipment.shipment = xml_data.xpath('//shipment/shipment').text
    shipment.shipment_type = xml_data.xpath('//shipment/shipment_type').text
    shipment.shipment_carrier = xml_data.xpath('//shipment/shipment_carrier').text

    shipments << shipment

    shipment = ShipmentDetail.new
    shipment.shipment = xml_data.xpath('//shipment/shipment').text
    shipment.shipment_type = xml_data.xpath('//shipment/shipment_type').text
    shipment.shipment_carrier = xml_data.xpath('//shipment/shipment_carrier').text

    shipments << shipment


    render :xml => shipments.to_xml

  end
end
