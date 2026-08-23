package ratings
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import views.§_-Rj§;
   import views.§_-V2O§;
   
   public class §_-D1C§ extends §_-u2r§
   {
      
      protected static const §_-v1t§:int = 30;
      
      private var §_-62q§:DisplayObject = null;
      
      private var photo:§_-V2O§ = null;
      
      private var §_-w1U§:int = -1;
      
      public function §_-D1C§(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      override protected function get timeUpdate() : int
      {
         return §_-v1t§;
      }
      
      override protected function init() : void
      {
         super.init();
         this.photo = new §_-V2O§(36);
         this.photo.x = 185;
         this.photo.y = 5;
         addChild(this.photo);
         var _loc1_:RatingPlaceButton = new RatingPlaceButton();
         _loc1_.x = this.photo.x;
         _loc1_.y = this.photo.y;
         _loc1_.width = this.photo.width;
         _loc1_.height = this.photo.height;
         if(!this.isSelf)
         {
            _loc1_.addEventListener(MouseEvent.MOUSE_UP,§_-91v§);
         }
         addChild(_loc1_);
         this.§_-N2m§.x = 225;
         this.§_-32i§.x = 225;
         this.§_-73v§.x = 240;
      }
      
      override protected function §_-I17§(param1:int) : void
      {
      }
      
      override protected function update(param1:String, param2:int, param3:int, param4:int = 0, param5:int = 0, param6:Array = null) : void
      {
         super.update(param1,param2,param3,param4,param5,param6);
         this.league = this.isSelf ? §_-82O§.§_-a15§(this.type) : §_-82O§.§_-h1C§(param2,this.type);
      }
      
      override protected function §_-Y16§(param1:Player) : void
      {
         super.§_-Y16§(param1);
         this.photo.§_-yC§(param1);
      }
      
      protected function get league() : int
      {
         return this.§_-w1U§;
      }
      
      protected function set league(param1:int) : void
      {
         if(this.league == param1)
         {
            return;
         }
         this.§_-w1U§ = param1;
         if(this.§_-62q§)
         {
            removeChild(this.§_-62q§);
         }
         this.§_-62q§ = new §_-Rj§(this.league);
         this.§_-62q§.x = 160;
         this.§_-62q§.y = 25;
         addChild(this.§_-62q§);
         new §_-kr§(this.§_-62q§,gls("Лига: {0}",§_-93H§.§_-XY§(this.league,§_-82O§.PLAYER_TYPE)));
      }
   }
}

