class CharactersController < ApplicationController
    def new
        if logged_in?
            @character = Character.new
            @race_options = ["Aasimar", "Dragonborn", "Dwarf", "Elf", "Gnome", "Halfing", "Half-Elf", "Half-Orc", "Human", "Orc", "Tiefling"]
            @class_options = ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Paladin", "Monk", "Ranger", "Rouge" "Sorceror", "Warlock", "Wizard" ]
            @level_options = (1..20)
        else
            flash.alert = "You must be logged in!"
            redirect_to login_path
        end
    end

    def create

    end
    
    def edit

    end

    def update

    end

    def index

    end

    def show

    end

    def destroy

    end

    private

end
