tool
extends WindowDialog

const REGEX_STR:String = "(?<start>:description content=)(?<msg>.*)(?<end>><meta property=twitter:title content)"
const URL:String = "https://www.bible.com/verse-of-the-day"

onready var http:HTTPRequest = $HTTPRequest
onready var text:RichTextLabel = $RichTextLabel



func _ready() -> void:
	http.request(URL)

func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	
	var response := body.get_string_from_utf8()
	filter_message(response)


func filter_message(message:String) -> void:
	
	var regex = RegEx.new()
	regex.compile(REGEX_STR)
	var result :RegExMatch = regex.search(message)
	if result:
		text.text = result.get_string("msg")
		show()
		pass
	
	pass


func _on_bt_thanks_pressed() -> void:
	hide()
