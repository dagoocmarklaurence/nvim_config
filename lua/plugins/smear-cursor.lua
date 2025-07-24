return {
	"sphamba/smear-cursor.nvim",
	opts = {
		-- NOTE: smootcursor withour smear
		-- stiffness = 0.5,
		-- trailing_stiffness = 0.49,
		-- never_draw_over_target = false,

		-- NOTE: Faster
		-- stiffness = 0.8,
		-- trailing_stiffness = 0.5,
		-- distance_stop_animating = 0.5,

		-- NOTE: Fire hazzard
		cursor_color = "#ff8800",
		trailing_stiffness = 0.3,
		distance_stop_animating = 0.1,
		trailing_exponent = 5,
		hide_target_hack = true,
		gamma = 1,
	},
}
