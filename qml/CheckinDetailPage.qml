import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: page
    property string venue_id
    property alias venue_name: venue_name_label.text
    property alias venue_address: venue_address_label.text
    property alias icon: venue_category_icon.source
    property string event;

    property double lat;
    property double lon;
    property double deviceLat;
    property double deviceLon;

    property alias comment: comment_textarea.text
    property alias twitter: twitter_switch.checked
    property alias facebook: facebook_switch.checked

    MapPage {
        id: mapPage;
        lat: page.lat
        lon: page.lon
        deviceLat: page.deviceLat
        deviceLon: page.deviceLon
    }

    SilicaFlickable {
        anchors.fill: parent;
        contentHeight: contentItem.childrenRect.height


        Column {
            width: parent.width

            DialogHeader {
                id: dialogHeader;
                acceptText: qsTr("Checkin")
            }

            Item {
                width: parent.width
                height: Math.max(venue_category_icon.height, venue_name_label.height + venue_address_label.height)

                Image {
                    id: venue_category_icon
                    anchors.left: parent.left;
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 10;
                    anchors.leftMargin: 10;
                    width: 64;
                    height: 64;

                }

                Label {
                    id: venue_name_label
                    anchors.left: venue_category_icon.right
                    anchors.right: parent.right
                    anchors.top: parent.top;
                    anchors.rightMargin: 10;
                    anchors.leftMargin: 10;

                    wrapMode: Text.Wrap
                    color: Theme.primaryColor
                    font.pixelSize: Theme.fontSizeLarge
                }
                Label {
                    id: venue_address_label
                    anchors.left: venue_category_icon.right
                    anchors.right: parent.right
                    anchors.top: venue_name_label.bottom;
                    anchors.rightMargin: 10;
                    anchors.leftMargin: 10;

                    wrapMode: Text.Wrap
                    color: Theme.secondaryColor
                    font.pixelSize: Theme.fontSizeSmall
                }
            }
            TextArea {
                id: comment_textarea
                width: parent.width
                height: 350
                placeholderText: qsTr("Write your comment here.")
            }

            TextSwitch {
                id: facebook_switch
                text: qsTr("Share on Facebook")
            }

            TextSwitch {
                id: twitter_switch
                text: qsTr("Share on Twitter")
            }

            Button {
                text: qsTr("Show on Map")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    pageStack.push(mapPage)
                }
            }

        }
    }
}
