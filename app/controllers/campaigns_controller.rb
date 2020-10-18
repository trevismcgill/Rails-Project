class CampaignsController < ApplicationController
    helper_method :campaign_participant?

    def new
        if logged_in?
            @campaign = Campaign.new
            campaign_options
        else
            flash.alert = "You must be logged in!"
            redirect_to login_path
        end
    end

    def create
        @campaign = Campaign.new(campaign_params)
        if @campaign.save
            redirect_to campaign_path(@campaign)
        else
            flash.alert = @campaign.errors.full_messages
            redirect_to new_campaign_path
        end
    end
    
    def edit
        @campaign = Campaign.find_by_id(params[:id])
        if campaign_participant?
            campaign_options
        else 
            flash.alert = "That is not your campaign!"
            redirect_to user_campaigns_path(current_user)
        end
    end

    def update
        @campaign = Campaign.find_by_id(params[:id])
        if campaign_participant?
            @campaign.assign_attributes(campaign_params)
            if @campaign.valid?
                @campaign.update(campaign_params)
                # redirect_to user_campaign_path(current_user, @campaign)
            else
                flash.alert = @campaign.errors.full_messages
            end
        else
            flash.alert = "This is not your campaign!"
            redirect_to campaigns_path
        end
    end

    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @campaigns = @user.campaigns
        else
            @campaigns = Campaign.all
        end
    end

    def show
        @campaign = Campaign.find_by_id(params[:id])
    end

    def destroy
        @campaign = Campaign.find_by_id(params[:id])
        if campaign_participant?
            @campaign.destroy
            # redirect_to campaign_character_path(current_user)
        else
            flash.alert = "This is not your campaign!"
            redirect_to campaigns_path
        end
    end

    private

    def campaign_params
        params.require(:campaign).permit(:campaign_name, :setting, :min_level)
    end

    def campaign_options
        @level_options = (1..20)
    end

    def campaign_participant?
        if logged_in?
            @campaign.users.include?(current_user)
        end
    end
end
