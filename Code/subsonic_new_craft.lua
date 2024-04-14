
PlaceObj('CraftOperationsRecipeDef', {
	CraftTime = 15,
	Ingredients = {
		PlaceObj('RecipeIngredient', {
			'item', "Parts",
			'amount', 8,
		}),
		PlaceObj('RecipeIngredient', {
			'item', "_44CAL_Basic",
			'amount', 24,
		}),
	},
	ResultItem = PlaceObj('RecipeIngredient', {
		'item', "_44CAL_Subsonic",
		'amount', 24,
	}),
	group = "Ammo",
	id = "44Subsonic_Craft",

})