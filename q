
[1mFrom:[0m /mnt/c/users/Trevis McGill/development/flatiron/projects/rails-project/app/controllers/characters_controller.rb:63 CharactersController#index:

    [1;34m60[0m: [32mdef[0m [1;34mindex[0m
    [1;34m61[0m:     character_options
    [1;34m62[0m:     binding.pry
 => [1;34m63[0m:     [32mif[0m params[[33m:user_id[0m] || params[[33m:campaign_id[0m]
    [1;34m64[0m:         [32mif[0m params[[33m:user_id[0m]
    [1;34m65[0m:             @user = [1;34;4mUser[0m.find_by_id(params[[33m:user_id[0m])                    
    [1;34m66[0m:             @characters = @user.characters
    [1;34m67[0m:         [32melse[0m
    [1;34m68[0m:             @campaign = [1;34;4mCampaign[0m.find_by_id(params[[33m:campaign_id[0m])
    [1;34m69[0m:             @characters = @campaign.characters
    [1;34m70[0m:         [32mend[0m
    [1;34m71[0m:     [32melsif[0m params[[33m:character_class[0m]
    [1;34m72[0m:         @characters = [1;34;4mCharacter[0m.character_class_filter(params[[33m:character_class[0m])
    [1;34m73[0m:         binding.pry
    [1;34m74[0m:     [32melse[0m
    [1;34m75[0m:         @characters = [1;34;4mCharacter[0m.all
    [1;34m76[0m:     [32mend[0m
    [1;34m77[0m: [32mend[0m

