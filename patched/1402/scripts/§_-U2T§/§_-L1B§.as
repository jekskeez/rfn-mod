package §_-U2T§
{
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
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
   import sounds.§_-RH§;
   import utils.§_-12w§;
   import utils.§_-j2O§;
   
   public class §_-L1B§ extends Dialog
   {
      
      private static const §_-52U§:Array = [RatingIconNone,RatingBronzeAnimation,RatingSilverAnimation,RatingGoldAnimation,RatingMasterAnimation,RatingDiamondAnimation,RatingChampionAnimation];
      
      private static const §_-kv§:Array = [null,RepostImageBronze,RepostImageSilver,RepostImageGold,RepostImageMaster,RepostImageDiamond,RepostImageChampion];
      
      private static const §_-B34§:GlowFilter = new GlowFilter(16777215,1,4,4,8);
      
      private static const §_-RP§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      private static const §_-1z§:DropShadowFilter = new DropShadowFilter(2,45,0,1,2,2,0.25);
      
      private static const §_-W2z§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,17,16777215);
      
      private static const §_-639§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,17,16774584);
      
      private var league:int = -1;
      
      private var type:int = -1;
      
      private var §_-22B§:MovieClip = null;
      
      public function §_-L1B§(param1:int, param2:int)
      {
         super(gls("Поздравляем!"));
         this.league = param1;
         this.type = param2;
         this.init();
         this.sound = §_-RH§.§_-T1§;
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,24,16763904,null,null,null,null,null,"center");
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 0;
         this.§_-7N§ = 0;
         this.topOffset = 0;
         this.§_-f2d§ = 0;
      }
      
      override protected function initClose() : void
      {
         super.initClose();
         if(!this.§_-x2T§)
         {
            return;
         }
         this.§_-x2T§.x -= 20;
         this.§_-x2T§.y += 10;
      }
      
      private function init() : void
      {
         this.§_-22B§ = new §_-52U§[this.league]();
         this.§_-22B§.scaleX = this.§_-22B§.scaleY = 6;
         this.§_-22B§.x = 160;
         this.§_-22B§.y = 80;
         this.§_-22B§.addFrameScript(this.§_-22B§.totalFrames - 1,this.§_-t2l§);
         addChild(this.§_-22B§);
         var _loc1_:§_-i5§ = new §_-i5§(this.type == §_-82O§.CLAN_TYPE ? gls("Твой клан перешёл в лигу:") : gls("Ты перешёл в лигу:"),0,178,new TextFormat(§_-i5§.§_-p1s§,16,9266750));
         _loc1_.x = 160 - int(_loc1_.textWidth * 0.5);
         addChild(_loc1_);
         _loc1_ = new §_-i5§(§_-93H§.§_-XY§(this.league,§_-82O§.PLAYER_TYPE),0,198,new TextFormat(§_-i5§.§_-p1s§,22,2211605));
         _loc1_.x = 160 - int(_loc1_.textWidth * 0.5) - 3;
         _loc1_.filters = [§_-B34§,§_-1z§];
         addChild(_loc1_);
         var _loc2_:§_-K2G§ = new §_-K2G§(gls("Поделиться"));
         _loc2_.x = 160 - int(_loc2_.width * 0.5);
         _loc2_.y = 250;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-G1X§);
         addChild(_loc2_);
         place();
         this.width = 320;
         this.height = 330;
      }
      
      private function §_-G1X§(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(new §_-kv§[this.league]());
         var _loc3_:DisplayObject = §_-uR§.§_-t2O§();
         _loc3_.scaleX = _loc3_.scaleY = 0.5;
         _loc3_.x = int((_loc2_.width - _loc3_.width) * 0.5);
         _loc3_.y = int(_loc2_.height - _loc3_.height - 5);
         _loc2_.addChild(_loc3_);
         var _loc4_:§_-i5§ = new §_-i5§(this.type == §_-82O§.CLAN_TYPE ? gls("Мой клан достиг лиги:") : gls("Я достиг лиги:"),0,15,§_-W2z§);
         var _loc5_:§_-i5§ = new §_-i5§(§_-93H§.§_-XY§(this.league,§_-82O§.PLAYER_TYPE),0,15,§_-639§);
         _loc4_.x = int((_loc2_.width - (_loc4_.textWidth + _loc5_.textWidth + 3)) * 0.5);
         _loc5_.x = _loc4_.x + _loc4_.textWidth + 3;
         _loc4_.filters = [§_-RP§];
         _loc5_.filters = [§_-RP§];
         _loc2_.addChild(_loc4_);
         _loc2_.addChild(_loc5_);
         var _loc6_:BitmapData = new BitmapData(280,280);
         _loc6_.draw(_loc2_);
         §_-m2d§.save(_loc6_,"new_league_" + this.league,false);
         §_-j2O§.place(Game.self,§_-j2O§.WALL_RATING_LEAGUE,this.league,new Bitmap(_loc6_),this.type == §_-82O§.CLAN_TYPE ? gls("Мой клан достиг новой лиги!") : gls("Я достиг новой лиги!"));
      }
      
      private function §_-t2l§() : void
      {
         this.§_-22B§.stop();
         §_-12w§.§_-b1b§(this.§_-22B§);
      }
   }
}

