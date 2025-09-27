function Save_Game(){

	var save_file_path = "save.txt"

	var file_id = file_text_open_write(save_file_path);

	file_text_write_real(file_id, global.playerTimerScore);
	
	file_text_close(file_id);
	
}

function Load_Game()
{
	if(file_exists("save.txt"))
	{
		var file_id = file_text_open_read("save.txt"); 
		
		global.playerTimerScore = file_text_read_real(file_id);
		
		file_text_close(file_id);
		
	}
}