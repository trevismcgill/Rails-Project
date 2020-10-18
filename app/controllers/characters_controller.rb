class CharactersController < ApplicationController
    helper_method :character_owner?
    
    def new
        if logged_in?
            @character = Character.new
            character_options
        else
            flash.alert = "You must be logged in!"
            redirect_to login_path
        end
    end

    def create
        @character = Character.new(character_params)
        @character[:user_id] = current_user.id
        if @character.save
            redirect_to user_character_path(current_user, @character)
        else
            flash.alert = @character.errors.full_messages
            redirect_to new_character_path
        end
    end
    
    def edit
        @character = Character.find_by_id(params[:id])
        if character_owner?
            character_options
        else 
            flash.alert = "That is not your character!"
            redirect_to user_characters_path(current_user)
        end
    end

    def update
        @character = Character.find_by_id(params[:id])
        if character_owner?
            @character.assign_attributes(character_params)
            if @character.valid?
                @character.update(character_params)
                redirect_to user_character_path(current_user, @character)
            else
                flash.alert = @character.errors.full_messages
            end
        else
            flash.alert = "This is not your character!"
            redirect_to characters_path
        end
    end

    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @characters = @user.characters
        else
            @characters = Character.all
        end
    end

    def show
        @character = Character.find_by_id(params[:id])
    end

    def destroy
        @character = Character.find_by_id(params[:id])
        if character_owner?
            @character.destroy
            redirect_to user_characters_path(current_user)
        else
            flash.alert = "This is not your character!"
            redirect_to characters_path
        end
    end

    private

    def character_params
        params.require(:character).permit(:name, :race, :character_class, :level, :campaign_id)
    end

    def character_options
        @race_options = ["Aasimar", "Dragonborn", "Dwarf", "Elf", "Gnome", "Halfing", "Half-Elf", "Half-Orc", "Human", "Orc", "Tiefling"]
        @class_options = ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Paladin", "Monk", "Ranger", "Rouge", "Sorceror", "Warlock", "Wizard" ]
        @level_options = (1..20)
        @campaign_options = Campaign.all.collect do |c| 
            c.campaign_name
            c.id
        end
    end

    def character_owner?
        if logged_in?
            @character.user_id == current_user.id
        end
    end
end
