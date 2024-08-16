extends CanvasLayer

@export_file("*.json") var dlog_file

var dialogue = []
var current_dlog_id = 0
var active_dlog = false

func _ready():
	$NinePatchRect.visible = false
	_start_dialogue()
	
func _start_dialogue():
	if active_dlog:
		return
	else:
		active_dlog = true
		$NinePatchRect.visible = true
	dialogue = _load_dialogue()
	current_dlog_id = -1
	next_line()
	
func _load_dialogue():
	var file = FileAccess.open("res://dialogue/guide_dlog.json", FileAccess.READ)
	var file_content = JSON.parse_string(file.get_as_text())
	return file_content
	
func _input(event):
	if !active_dlog:
		return
	if event.is_action_pressed("ui_accept"):
		next_line()
	
func next_line():
	current_dlog_id += 1
	if current_dlog_id >= len(dialogue):
		active_dlog = false
		$NinePatchRect.visible = false
		return
	$NinePatchRect/Name.text = dialogue[current_dlog_id]['name']
	$NinePatchRect/Text.text = dialogue[current_dlog_id]['text']
