package ratings
{
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import §_-e1G§.§_-Hb§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import views.§_-S1U§;
   import views.§_-s1A§;
   
   public class §_-l1x§ extends §_-f1T§
   {
      
      protected static const §_-gb§:int = 30;
      
      private var §_-Z25§:DisplayObject = null;
      
      private var photo:§_-s1A§ = null;
      
      private var §_-g2B§:int = -1;
      
      public function §_-l1x§(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      override protected function get timeUpdate() : int
      {
         return §_-gb§;
      }
      
      override protected function init() : void
      {
         super.init();
         this.photo = new §_-s1A§(36);
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
            _loc1_.addEventListener(MouseEvent.MOUSE_UP,§_-Z2P§);
         }
         addChild(_loc1_);
         this.§_-Uk§.x = 225;
         this.§_-zQ§.x = 225;
         this.§_-Pe§.x = 240;
      }
      
      override protected function §_-01m§(param1:int) : void
      {
      }
      
      override protected function update(param1:String, param2:int, param3:int, param4:int = 0, param5:int = 0, param6:Array = null) : void
      {
         super.update(param1,param2,param3,param4,param5,param6);
         this.league = this.isSelf ? §_-13r§.§_-DX§(this.type) : §_-13r§.§_-K1M§(param2,this.type);
      }
      
      override protected function §_-P9§(param1:Player) : void
      {
         super.§_-P9§(param1);
         this.photo.§_-031§(param1);
      }
      
      protected function get league() : int
      {
         return this.§_-g2B§;
      }
      
      protected function set league(param1:int) : void
      {
         if(this.league == param1)
         {
            return;
         }
         this.§_-g2B§ = param1;
         if(this.§_-Z25§)
         {
            removeChild(this.§_-Z25§);
         }
         this.§_-Z25§ = new §_-S1U§(this.league);
         this.§_-Z25§.x = 160;
         this.§_-Z25§.y = 25;
         addChild(this.§_-Z25§);
         new §_-Hb§(this.§_-Z25§,gls("Лига: {0}",§_-8S§.§_-11s§(this.league,§_-13r§.PLAYER_TYPE)));
      }
   }
}

