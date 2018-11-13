echo -e "\n--\n+> Setting up Elasticsearch dummy data"

curl -XPOST "http://localhost:9200/atm_possible_fraud/kafkaconnect" -H 'Content-Type: application/json' -d'{
          "KMH_REQUIRED": 527.1998991368968,
          "T2_TIMESTAMP": 1539033613000,
          "T1_LOCATION": "53.796226,-1.5426083",
          "MINUTES_DIFFERENCE": 2.95,
          "ACCOUNT_ID": "a876",
          "T1_TIMESTAMP": 1539033436000,
          "T1_TRANSACTION_ID": "xxx8fbdbc0c-cb37-11e8-8c82-186590d22a35",
          "T2_LOCATION": "53.7093482,-1.9084583",
          "T1_ATM": "HSBC",
          "T1_AMOUNT": 50,
          "T2_TRANSACTION_ID": "8fbdbc0c-cb37-11e8-8c82-186590d22a35",
          "T2_AMOUNT": 50,
          "T2_ATM": "ATM : 245798860",
          "MILLISECONDS_DIFFERENCE": 177000,
          "DISTANCE_BETWEEN_TXN_KM": 25.920661707564093
        }'
curl -XPOST "http://localhost:9200/kafka-atm_txns_gess-2018-10/kafkaconnect" -H 'Content-Type: application/json' -d'{
          "transaction_id": "42cdbcf5-cb3b-11e8-854a-186590d22a35",
          "amount": 50,
          "account_id": "a110",
          "location": {
            "lon": "-1.7128077",
            "lat": "53.8742612"
          },
          "atm": "Barclays",
          "timestamp": "2018-10-08 21:46:41 +0000"
        } '

echo -e "\n--\n+> Opt out of Kibana telemetry"
curl 'http://localhost:5601/api/kibana/settings' -H 'kbn-version: 6.4.2' -H 'content-type: application/json' -H 'accept: application/json' --data-binary '{"changes":{"telemetry:optIn":false}}' --compressed

echo -e "\n--\n+> Register Kibana indices"
curl 'http://localhost:5601/api/saved_objects/index-pattern/87cbfd20-cb38-11e8-bd8b-317490a9cb4d'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"atm_possible_fraud","timeFieldName":"T1_TIMESTAMP","fields":"[{\"name\":\"ACCOUNT_ID\",\"type\":\"string\",\"count\":2,\"scripted\":false,\"searchable\":true,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"ACCOUNT_ID.keyword\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"DISTANCE_BETWEEN_TXN_KM\",\"type\":\"number\",\"count\":1,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"KMH_REQUIRED\",\"type\":\"number\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"MILLISECONDS_DIFFERENCE\",\"type\":\"number\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"MINUTES_DIFFERENCE\",\"type\":\"number\",\"count\":1,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T1_AMOUNT\",\"type\":\"number\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T1_ATM\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"T1_ATM.keyword\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T1_LOCATION\",\"type\":\"geo_point\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T1_TIMESTAMP\",\"type\":\"date\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T1_TRANSACTION_ID\",\"type\":\"string\",\"count\":1,\"scripted\":false,\"searchable\":true,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"T1_TRANSACTION_ID.keyword\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T2_AMOUNT\",\"type\":\"number\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T2_ATM\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"T2_ATM.keyword\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T2_LOCATION\",\"type\":\"geo_point\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T2_TIMESTAMP\",\"type\":\"date\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"T2_TRANSACTION_ID\",\"type\":\"string\",\"count\":1,\"scripted\":false,\"searchable\":true,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"T2_TRANSACTION_ID.keyword\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"_id\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":false},{\"name\":\"_index\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":false},{\"name\":\"_score\",\"type\":\"number\",\"count\":0,\"scripted\":false,\"searchable\":false,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"_source\",\"type\":\"_source\",\"count\":0,\"scripted\":false,\"searchable\":false,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"_type\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":false}]","fieldFormatMap":"{\"T1_AMOUNT\":{},\"T2_AMOUNT\":{}}"}}'
curl 'http://localhost:5601/api/saved_objects/index-pattern/5c9e13a0-cb3c-11e8-bd8b-317490a9cb4d'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"kafka-atm_txns_gess*","timeFieldName":"timestamp","fields":"[{\"name\":\"_id\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":false},{\"name\":\"_index\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":false},{\"name\":\"_score\",\"type\":\"number\",\"count\":0,\"scripted\":false,\"searchable\":false,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"_source\",\"type\":\"_source\",\"count\":0,\"scripted\":false,\"searchable\":false,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"_type\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":false},{\"name\":\"account_id\",\"type\":\"string\",\"count\":1,\"scripted\":false,\"searchable\":true,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"account_id.keyword\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"amount\",\"type\":\"number\",\"count\":1,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"atm\",\"type\":\"string\",\"count\":1,\"scripted\":false,\"searchable\":true,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"atm.keyword\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"location\",\"type\":\"geo_point\",\"count\":2,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"timestamp\",\"type\":\"date\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true},{\"name\":\"transaction_id\",\"type\":\"string\",\"count\":1,\"scripted\":false,\"searchable\":true,\"aggregatable\":false,\"readFromDocValues\":false},{\"name\":\"transaction_id.keyword\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"searchable\":true,\"aggregatable\":true,\"readFromDocValues\":true}]"}}'

echo -e "\n--\n+> Set default Kibana index"
curl -s 'http://localhost:5601/api/kibana/settings' -H 'kbn-version: 6.4.2' -H 'Content-Type: application/json;charset=UTF-8' -H 'Accept: application/json, text/plain, */*' --data-binary '{"changes":{"defaultIndex":"5c9e13a0-cb3c-11e8-bd8b-317490a9cb4d"}}' --compressed

echo -e "\n--\n+> Import Kibana objects"

curl 'http://localhost:5601/api/saved_objects/search/a4d048f0-cb3c-11e8-bd8b-317490a9cb4d?overwrite=true'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"All ATM transactions","description":"","hits":0,"columns":["account_id","atm","amount","location","transaction_id"],"sort":["timestamp","desc"],"version":1,"kibanaSavedObjectMeta":{"searchSourceJSON":"{\"index\":\"5c9e13a0-cb3c-11e8-bd8b-317490a9cb4d\",\"highlightAll\":true,\"version\":true,\"query\":{\"language\":\"lucene\",\"query\":\"\"},\"filter\":[]}"}}}'
curl 'http://localhost:5601/api/saved_objects/search/d98fbb50-cb39-11e8-bd8b-317490a9cb4d?overwrite=true'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"Fraudulent ATM transactions","description":"","hits":0,"columns":["T1_ATM","T2_ATM","DISTANCE_BETWEEN_TXN_KM","MINUTES_DIFFERENCE","T1_AMOUNT","T2_AMOUNT","T1_TRANSACTION_ID","T2_TRANSACTION_ID","ACCOUNT_ID"],"sort":["T1_TIMESTAMP","desc"],"version":1,"kibanaSavedObjectMeta":{"searchSourceJSON":"{\"index\":\"87cbfd20-cb38-11e8-bd8b-317490a9cb4d\",\"highlightAll\":true,\"version\":true,\"query\":{\"language\":\"lucene\",\"query\":\"\"},\"filter\":[]}"}}}'
curl 'http://localhost:5601/api/saved_objects/dashboard/atm-transactions?overwrite=true'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"ATM transactions","hits":0,"description":"","panelsJSON":"[{\"embeddableConfig\":{\"mapZoom\":9,\"mapCenter\":[53.741875383069974,-1.710360241122544]},\"gridData\":{\"x\":0,\"y\":0,\"w\":19,\"h\":29,\"i\":\"1\"},\"id\":\"e9f995f0-cb3a-11e8-bd8b-317490a9cb4d\",\"panelIndex\":\"1\",\"type\":\"visualization\",\"version\":\"6.4.2\"},{\"embeddableConfig\":{\"columns\":[\"account_id\",\"atm\",\"amount\",\"transaction_id\"]},\"gridData\":{\"x\":19,\"y\":0,\"w\":29,\"h\":29,\"i\":\"2\"},\"id\":\"a4d048f0-cb3c-11e8-bd8b-317490a9cb4d\",\"panelIndex\":\"2\",\"type\":\"search\",\"version\":\"6.4.2\"}]","optionsJSON":"{\"darkTheme\":false,\"hidePanelTitles\":false,\"useMargins\":true}","version":1,"timeRestore":false,"kibanaSavedObjectMeta":{"searchSourceJSON":"{\"query\":{\"language\":\"lucene\",\"query\":\"\"},\"filter\":[]}"}}}'
curl 'http://localhost:5601/api/saved_objects/dashboard/fraudulent-atm-transactions?overwrite=true'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"Fraudulent ATM transactions","hits":0,"description":"","panelsJSON":"[{\"embeddableConfig\":{\"mapCenter\":[53.741875383069974,-1.710360241122544],\"mapZoom\":9},\"gridData\":{\"x\":0,\"y\":0,\"w\":19,\"h\":28,\"i\":\"1\"},\"id\":\"e9f995f0-cb3a-11e8-bd8b-317490a9cb4d\",\"panelIndex\":\"1\",\"type\":\"visualization\",\"version\":\"6.4.2\"},{\"embeddableConfig\":{\"columns\":[\"T1_ATM\",\"T2_ATM\",\"T1_AMOUNT\",\"T2_AMOUNT\",\"ACCOUNT_ID\"]},\"gridData\":{\"x\":19,\"y\":0,\"w\":29,\"h\":17,\"i\":\"3\"},\"id\":\"d98fbb50-cb39-11e8-bd8b-317490a9cb4d\",\"panelIndex\":\"3\",\"type\":\"search\",\"version\":\"6.4.2\"},{\"embeddableConfig\":{},\"gridData\":{\"x\":19,\"y\":17,\"w\":14,\"h\":11,\"i\":\"4\"},\"id\":\"86b03aa0-cb3d-11e8-bd8b-317490a9cb4d\",\"panelIndex\":\"4\",\"type\":\"visualization\",\"version\":\"6.4.2\"},{\"embeddableConfig\":{},\"gridData\":{\"x\":33,\"y\":17,\"w\":15,\"h\":11,\"i\":\"5\"},\"id\":\"8fa774c0-cb3d-11e8-bd8b-317490a9cb4d\",\"panelIndex\":\"5\",\"type\":\"visualization\",\"version\":\"6.4.2\"}]","optionsJSON":"{\"darkTheme\":false,\"hidePanelTitles\":false,\"useMargins\":true}","version":1,"timeRestore":false,"kibanaSavedObjectMeta":{"searchSourceJSON":"{\"query\":{\"language\":\"lucene\",\"query\":\"\"},\"filter\":[]}"}}}'
curl 'http://localhost:5601/api/saved_objects/visualization/e9f995f0-cb3a-11e8-bd8b-317490a9cb4d?overwrite=true'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"Map","visState":"{\"title\":\"Map\",\"type\":\"tile_map\",\"params\":{\"colorSchema\":\"Yellow to Red\",\"mapType\":\"Scaled Circle Markers\",\"isDesaturated\":true,\"addTooltip\":true,\"heatClusterSize\":1.5,\"legendPosition\":\"bottomright\",\"mapZoom\":2,\"mapCenter\":[0,0],\"wms\":{\"enabled\":false,\"options\":{\"format\":\"image/png\",\"transparent\":true},\"baseLayersAreLoaded\":{\"_c\":[],\"_s\":1,\"_d\":true,\"_v\":true,\"_h\":0,\"_n\":false},\"tmsLayers\":[{\"id\":\"road_map\",\"url\":\"https://tiles.maps.elastic.co/v2/default/{z}/{x}/{y}.png?elastic_tile_service_tos=agree&my_app_name=kibana&my_app_version=6.4.2&license=40a3419e-7d1b-4da4-b631-cb2741294109\",\"minZoom\":0,\"maxZoom\":18,\"attribution\":\"<p>&#169; <a href=\\\"http://www.openstreetmap.org/copyright\\\">OpenStreetMap</a> contributors | <a href=\\\"https://www.elastic.co/elastic-maps-service\\\">Elastic Maps Service</a></p>&#10;\",\"subdomains\":[]}],\"selectedTmsLayer\":{\"id\":\"road_map\",\"url\":\"https://tiles.maps.elastic.co/v2/default/{z}/{x}/{y}.png?elastic_tile_service_tos=agree&my_app_name=kibana&my_app_version=6.4.2&license=40a3419e-7d1b-4da4-b631-cb2741294109\",\"minZoom\":0,\"maxZoom\":18,\"attribution\":\"<p>&#169; <a href=\\\"http://www.openstreetmap.org/copyright\\\">OpenStreetMap</a> contributors | <a href=\\\"https://www.elastic.co/elastic-maps-service\\\">Elastic Maps Service</a></p>&#10;\",\"subdomains\":[]}}},\"aggs\":[{\"id\":\"1\",\"enabled\":true,\"type\":\"count\",\"schema\":\"metric\",\"params\":{}},{\"id\":\"2\",\"enabled\":true,\"type\":\"geohash_grid\",\"schema\":\"segment\",\"params\":{\"field\":\"T1_LOCATION\",\"autoPrecision\":true,\"isFilteredByCollar\":true,\"useGeocentroid\":true,\"mapZoom\":9,\"mapCenter\":{\"lon\":-1.6153335571289065,\"lat\":53.80227291669384},\"precision\":4}}]}","uiStateJSON":"{\"mapZoom\":7,\"mapCenter\":[53.140180585580424,-1.9006347656250002]}","description":"","version":1,"kibanaSavedObjectMeta":{"searchSourceJSON":"{\"index\":\"87cbfd20-cb38-11e8-bd8b-317490a9cb4d\",\"query\":{\"query\":\"\",\"language\":\"lucene\"},\"filter\":[]}"}}}'
curl 'http://localhost:5601/api/saved_objects/visualization/86b03aa0-cb3d-11e8-bd8b-317490a9cb4d?overwrite=true'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"Top Fraud ATMs (T1)","visState":"{\"title\":\"Top Fraud ATMs (T1)\",\"type\":\"histogram\",\"params\":{\"type\":\"histogram\",\"grid\":{\"categoryLines\":false,\"style\":{\"color\":\"#eee\"}},\"categoryAxes\":[{\"id\":\"CategoryAxis-1\",\"type\":\"category\",\"position\":\"bottom\",\"show\":false,\"style\":{},\"scale\":{\"type\":\"linear\"},\"labels\":{\"show\":true,\"truncate\":100},\"title\":{}}],\"valueAxes\":[{\"id\":\"ValueAxis-1\",\"name\":\"LeftAxis-1\",\"type\":\"value\",\"position\":\"left\",\"show\":true,\"style\":{},\"scale\":{\"type\":\"linear\",\"mode\":\"normal\"},\"labels\":{\"show\":true,\"rotate\":0,\"filter\":false,\"truncate\":100},\"title\":{\"text\":\"Count\"}}],\"seriesParams\":[{\"show\":\"true\",\"type\":\"histogram\",\"mode\":\"normal\",\"data\":{\"label\":\"Count\",\"id\":\"1\"},\"valueAxis\":\"ValueAxis-1\",\"drawLinesBetweenPoints\":true,\"showCircles\":true}],\"addTooltip\":true,\"addLegend\":true,\"legendPosition\":\"right\",\"times\":[],\"addTimeMarker\":false},\"aggs\":[{\"id\":\"1\",\"enabled\":true,\"type\":\"count\",\"schema\":\"metric\",\"params\":{}},{\"id\":\"3\",\"enabled\":true,\"type\":\"terms\",\"schema\":\"group\",\"params\":{\"field\":\"T1_ATM.keyword\",\"size\":5,\"order\":\"desc\",\"orderBy\":\"1\",\"otherBucket\":false,\"otherBucketLabel\":\"Other\",\"missingBucket\":false,\"missingBucketLabel\":\"Missing\"}}]}","uiStateJSON":"{\"vis\":{\"legendOpen\":false}}","description":"","version":1,"kibanaSavedObjectMeta":{"searchSourceJSON":"{\"index\":\"87cbfd20-cb38-11e8-bd8b-317490a9cb4d\",\"query\":{\"query\":\"\",\"language\":\"lucene\"},\"filter\":[]}"}}}'
curl 'http://localhost:5601/api/saved_objects/visualization/8fa774c0-cb3d-11e8-bd8b-317490a9cb4d?overwrite=true'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"Top Fraud ATMs (T2)","visState":"{\"title\":\"Top Fraud ATMs (T2)\",\"type\":\"histogram\",\"params\":{\"type\":\"histogram\",\"grid\":{\"categoryLines\":false,\"style\":{\"color\":\"#eee\"}},\"categoryAxes\":[{\"id\":\"CategoryAxis-1\",\"type\":\"category\",\"position\":\"bottom\",\"show\":false,\"style\":{},\"scale\":{\"type\":\"linear\"},\"labels\":{\"show\":true,\"truncate\":100},\"title\":{}}],\"valueAxes\":[{\"id\":\"ValueAxis-1\",\"name\":\"LeftAxis-1\",\"type\":\"value\",\"position\":\"left\",\"show\":true,\"style\":{},\"scale\":{\"type\":\"linear\",\"mode\":\"normal\"},\"labels\":{\"show\":true,\"rotate\":0,\"filter\":false,\"truncate\":100},\"title\":{\"text\":\"Count\"}}],\"seriesParams\":[{\"show\":\"true\",\"type\":\"histogram\",\"mode\":\"normal\",\"data\":{\"label\":\"Count\",\"id\":\"1\"},\"valueAxis\":\"ValueAxis-1\",\"drawLinesBetweenPoints\":true,\"showCircles\":true}],\"addTooltip\":true,\"addLegend\":true,\"legendPosition\":\"right\",\"times\":[],\"addTimeMarker\":false},\"aggs\":[{\"id\":\"1\",\"enabled\":true,\"type\":\"count\",\"schema\":\"metric\",\"params\":{}},{\"id\":\"3\",\"enabled\":true,\"type\":\"terms\",\"schema\":\"group\",\"params\":{\"field\":\"T2_ATM.keyword\",\"size\":5,\"order\":\"desc\",\"orderBy\":\"1\",\"otherBucket\":false,\"otherBucketLabel\":\"Other\",\"missingBucket\":false,\"missingBucketLabel\":\"Missing\"}}]}","uiStateJSON":"{\"vis\":{\"legendOpen\":false}}","description":"","version":1,"kibanaSavedObjectMeta":{"searchSourceJSON":"{\"index\":\"87cbfd20-cb38-11e8-bd8b-317490a9cb4d\",\"query\":{\"query\":\"\",\"language\":\"lucene\"},\"filter\":[]}"}}}'
curl 'http://localhost:5601/api/saved_objects/visualization/da75b1b0-cb3d-11e8-bd8b-317490a9cb4d?overwrite=true'  -H 'Accept: */*' -H 'Accept-Language: en-GB,en;q=0.5' --compressed -H 'content-type: application/json' -H 'kbn-version: 6.4.2' -H 'Connection: keep-alive' --data '{"attributes":{"title":"ATM heatmap","visState":"{\"title\":\"ATM heatmap\",\"type\":\"heatmap\",\"params\":{\"type\":\"heatmap\",\"addTooltip\":true,\"addLegend\":true,\"enableHover\":false,\"legendPosition\":\"bottom\",\"times\":[],\"colorsNumber\":5,\"colorSchema\":\"Yellow to Red\",\"setColorRange\":false,\"colorsRange\":[],\"invertColors\":false,\"percentageMode\":false,\"valueAxes\":[{\"show\":false,\"id\":\"ValueAxis-1\",\"type\":\"value\",\"scale\":{\"type\":\"linear\",\"defaultYExtents\":false},\"labels\":{\"show\":false,\"rotate\":0,\"overwriteColor\":false,\"color\":\"#555\"}}]},\"aggs\":[{\"id\":\"1\",\"enabled\":true,\"type\":\"count\",\"schema\":\"metric\",\"params\":{}},{\"id\":\"2\",\"enabled\":true,\"type\":\"terms\",\"schema\":\"segment\",\"params\":{\"field\":\"T1_ATM.keyword\",\"size\":5,\"order\":\"desc\",\"orderBy\":\"1\",\"otherBucket\":false,\"otherBucketLabel\":\"Other\",\"missingBucket\":false,\"missingBucketLabel\":\"Missing\"}},{\"id\":\"3\",\"enabled\":true,\"type\":\"terms\",\"schema\":\"group\",\"params\":{\"field\":\"T2_ATM.keyword\",\"size\":5,\"order\":\"desc\",\"orderBy\":\"1\",\"otherBucket\":false,\"otherBucketLabel\":\"Other\",\"missingBucket\":false,\"missingBucketLabel\":\"Missing\"}}]}","uiStateJSON":"{\"vis\":{\"defaultColors\":{\"0 - 1\":\"rgb(255,255,204)\",\"1 - 2\":\"rgb(254,225,135)\",\"2 - 3\":\"rgb(254,171,73)\",\"3 - 4\":\"rgb(252,91,46)\",\"4 - 5\":\"rgb(212,16,32)\"},\"legendOpen\":false}}","description":"","version":1,"kibanaSavedObjectMeta":{"searchSourceJSON":"{\"index\":\"87cbfd20-cb38-11e8-bd8b-317490a9cb4d\",\"query\":{\"query\":\"\",\"language\":\"lucene\"},\"filter\":[]}"}}}'
