package §_-91§
{
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import sounds.§_-43Z§;
   import utils.§_-73l§;
   import utils.§_-N1w§;
   
   public class §_-DD§ extends Dialog
   {
      
      private static const §_-M2S§:Array = [RatingIconNone,RatingBronzeAnimation,RatingSilverAnimation,RatingGoldAnimation,RatingMasterAnimation,RatingDiamondAnimation,RatingChampionAnimation];
      
      private static const §_-b1S§:Array = [null,RepostImageBronze,RepostImageSilver,RepostImageGold,RepostImageMaster,RepostImageDiamond,RepostImageChampion];
      
      private static const §_-x2T§:GlowFilter = new GlowFilter(16777215,1,4,4,8);
      
      private static const §_-52c§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      private static const §_-p25§:DropShadowFilter = new DropShadowFilter(2,45,0,1,2,2,0.25);
      
      private static const §_-Y2k§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,17,16777215);
      
      private static const §_-H2l§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,17,16774584);
      
      private var league:int = -1;
      
      private var type:int = -1;
      
      private var §_-n11§:MovieClip = null;
      
      public function §_-DD§(param1:int, param2:int)
      {
         super(gls("Поздравляем!"));
         this.league = param1;
         this.type = param2;
         this.init();
         this.sound = §_-43Z§.§_-23R§;
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,24,16763904,null,null,null,null,null,"center");
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 0;
         this.§_-4n§ = 0;
         this.topOffset = 0;
         this.§_-JZ§ = 0;
      }
      
      override protected function initClose() : void
      {
         super.initClose();
         if(!this.§_-O2e§)
         {
            return;
         }
         this.§_-O2e§.x -= 20;
         this.§_-O2e§.y += 10;
      }
      
      private function init() : void
      {
         this.§_-n11§ = new §_-M2S§[this.league]();
         this.§_-n11§.scaleX = this.§_-n11§.scaleY = 6;
         this.§_-n11§.x = 160;
         this.§_-n11§.y = 80;
         this.§_-n11§.addFrameScript(this.§_-n11§.totalFrames - 1,this.§_-n2r§);
         addChild(this.§_-n11§);
         var _loc1_:§_-22V§ = new §_-22V§(this.type == §_-13r§.CLAN_TYPE ? gls("Твой клан перешёл в лигу:") : gls("Ты перешёл в лигу:"),0,178,new TextFormat(§_-22V§.§_-pJ§,16,9266750));
         _loc1_.x = 160 - int(_loc1_.textWidth * 0.5);
         addChild(_loc1_);
         _loc1_ = new §_-22V§(§_-8S§.§_-11s§(this.league,§_-13r§.PLAYER_TYPE),0,198,new TextFormat(§_-22V§.§_-pJ§,22,2211605));
         _loc1_.x = 160 - int(_loc1_.textWidth * 0.5) - 3;
         _loc1_.filters = [§_-x2T§,§_-p25§];
         addChild(_loc1_);
         var _loc2_:§_-j18§ = new §_-j18§(gls("Поделиться"));
         _loc2_.x = 160 - int(_loc2_.width * 0.5);
         _loc2_.y = 250;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-E1B§);
         addChild(_loc2_);
         place();
         this.width = 320;
         this.height = 330;
      }
      
      private function §_-E1B§(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(new §_-b1S§[this.league]());
         var _loc3_:DisplayObject = §_-k2X§.§_-81z§();
         _loc3_.scaleX = _loc3_.scaleY = 0.5;
         _loc3_.x = int((_loc2_.width - _loc3_.width) * 0.5);
         _loc3_.y = int(_loc2_.height - _loc3_.height - 5);
         _loc2_.addChild(_loc3_);
         var _loc4_:§_-22V§ = new §_-22V§(this.type == §_-13r§.CLAN_TYPE ? gls("Мой клан достиг лиги:") : gls("Я достиг лиги:"),0,15,§_-Y2k§);
         var _loc5_:§_-22V§ = new §_-22V§(§_-8S§.§_-11s§(this.league,§_-13r§.PLAYER_TYPE),0,15,§_-H2l§);
         _loc4_.x = int((_loc2_.width - (_loc4_.textWidth + _loc5_.textWidth + 3)) * 0.5);
         _loc5_.x = _loc4_.x + _loc4_.textWidth + 3;
         _loc4_.filters = [§_-52c§];
         _loc5_.filters = [§_-52c§];
         _loc2_.addChild(_loc4_);
         _loc2_.addChild(_loc5_);
         var _loc6_:BitmapData = new BitmapData(280,280);
         _loc6_.draw(_loc2_);
         §_-E1s§.save(_loc6_,"new_league_" + this.league,false);
         §_-73l§.place(Game.self,§_-73l§.WALL_RATING_LEAGUE,this.league,new Bitmap(_loc6_),this.type == §_-13r§.CLAN_TYPE ? gls("Мой клан достиг новой лиги!") : gls("Я достиг новой лиги!"));
      }
      
      private function §_-n2r§() : void
      {
         this.§_-n11§.stop();
         §_-N1w§.§_-s2c§(this.§_-n11§);
      }
   }
}

