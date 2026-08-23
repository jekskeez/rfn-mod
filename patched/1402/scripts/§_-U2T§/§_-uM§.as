package §_-U2T§
{
   import §_-U19§.§_-B2U§;
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import utils.StringUtil;
   import utils.§_-12w§;
   import utils.§_-y1l§;
   import views.§_-Rj§;
   
   public class §_-uM§ extends Dialog
   {
      
      private static const §_-W2P§:TextFormat = new TextFormat(null,18,6697728,true,null,null,null,null,"center");
      
      private static const §_-fC§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,24,2211605);
      
      private static const §_-C3H§:Array = [gls("Твой результат за прошлый сезон:"),gls("Результат клана за прошлый сезон:")];
      
      private static const §_-r1h§:Array = [gls("Тебе не удалось\nпопасть в лигу"),gls("Вам не удалось\nпопасть в лигу")];
      
      private static const §_-I2U§:Array = [gls("Тебе удалось\nпопасть в лигу"),gls("Вам удалось\nпопасть в лигу")];
      
      private static const §_-r19§:Array = [gls("В новом сезоне ты получаешь"),gls("В новом сезоне вы получаете")];
      
      private static const §_-H4§:Array = [gls("Ты не участвовал\nв прошлом сезоне.\nВ новом сезоне ты\nне получаешь\nбонусных очков."),gls("Вы не участвовали\nв прошлом сезоне.\nВ новом сезоне вы\nне получаете\nбонусных очков.")];
      
      private static const §_-B34§:GlowFilter = new GlowFilter(16777215,1,4,4,8);
      
      private static const §_-1z§:DropShadowFilter = new DropShadowFilter(2,45,0,1,2,2,0.25);
      
      private var type:int = 0;
      
      private var state:int = 0;
      
      private var value:int = 0;
      
      public function §_-uM§(param1:int = 0, param2:int = -1, param3:int = 0)
      {
         super(gls("Итоги сезона"));
         this.type = param3;
         this.state = param1;
         this.value = param2 != -1 ? param2 : §_-82O§.§_-p1E§(this.type == §_-82O§.CLAN_TYPE ? §_-B2U§.§_-Q2g§(Game.self["clan_id"]).§_-gF§ : Game.self["rating_history"]);
         this.init();
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
         var _loc5_:§_-i5§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:§_-Rj§ = null;
         var _loc9_:Sprite = null;
         var _loc1_:int = 400;
         var _loc2_:int = 370;
         var _loc3_:MovieClip = new RatingChampionAnimation();
         _loc3_.scaleX = _loc3_.scaleY = 7;
         _loc3_.x = int(_loc1_ * 0.5);
         _loc3_.y = 90;
         addChild(_loc3_);
         _loc3_.gotoAndStop(_loc3_.totalFrames - 1);
         §_-12w§.§_-b1b§(_loc3_);
         _loc3_.filters = §_-y1l§.§_-Tk§;
         _loc3_.alpha = 0.1;
         switch(this.state)
         {
            case §_-82O§.§_-F2H§:
               _loc5_ = new §_-i5§(§_-C3H§[this.type],0,10,§_-W2P§);
               _loc5_.x = int((_loc1_ - _loc5_.textWidth) * 0.5);
               addChild(_loc5_);
               _loc6_ = int(this.value * §_-82O§.§_-82V§);
               _loc7_ = §_-82O§.§_-h1C§(this.value,this.type);
               _loc8_ = new §_-Rj§(_loc7_,3.5);
               _loc8_.x = 105;
               _loc8_.y = 100;
               addChild(_loc8_);
               if(_loc7_ == 0)
               {
                  addChild(new §_-i5§(§_-r1h§[this.type],210,80,§_-W2P§));
               }
               else
               {
                  addChild(new §_-i5§(§_-I2U§[this.type],210,60,§_-W2P§));
                  _loc5_ = new §_-i5§(§_-93H§.§_-XY§(_loc7_,this.type),0,103,§_-fC§);
                  _loc5_.x = 75 + int((_loc1_ - _loc5_.textWidth) * 0.5);
                  _loc5_.filters = [§_-B34§,§_-1z§];
                  addChild(_loc5_);
               }
               _loc9_ = new Sprite();
               _loc9_.graphics.beginFill(10053171,0.1);
               _loc9_.graphics.drawRoundRectComplex(0,190,_loc1_,_loc2_ - 230,0,0,5,5);
               addChild(_loc9_);
               _loc5_ = new §_-i5§(§_-r19§[this.type],0,200,§_-W2P§);
               _loc5_.x = int((_loc1_ - _loc5_.textWidth) * 0.5);
               addChild(_loc5_);
               _loc5_ = new §_-i5§(_loc6_.toString(),0,225,§_-fC§);
               _loc5_.x = int((_loc1_ - _loc5_.textWidth) * 0.5) - 3;
               _loc5_.filters = [§_-B34§,§_-1z§];
               addChild(_loc5_);
               _loc5_ = new §_-i5§(StringUtil.word("бонусное очко",_loc6_),0,255,§_-W2P§);
               _loc5_.x = int((_loc1_ - _loc5_.textWidth) * 0.5);
               addChild(_loc5_);
               break;
            case §_-82O§.§_-Kh§:
               _loc8_ = new §_-Rj§(0,3.5);
               _loc8_.x = 90;
               _loc8_.y = 65;
               addChild(_loc8_);
               _loc9_ = new Sprite();
               _loc9_.graphics.lineStyle(2,16777215);
               _loc9_.graphics.moveTo(4,4);
               _loc9_.graphics.lineTo(-4,-4);
               _loc9_.graphics.moveTo(-4,4);
               _loc9_.graphics.lineTo(4,-4);
               _loc9_.scaleX = _loc9_.scaleY = 3.5;
               _loc8_.addChild(_loc9_);
               _loc5_ = new §_-i5§(§_-H4§[this.type],180,10,§_-W2P§);
               addChild(_loc5_);
         }
         var _loc4_:§_-K2G§ = new §_-K2G§(gls("Ок"));
         _loc4_.x = int((_loc1_ - _loc4_.width) * 0.5);
         _loc4_.y = this.state == §_-82O§.§_-F2H§ ? 295 : 150;
         _loc4_.addEventListener(MouseEvent.CLICK,hide);
         addChild(_loc4_);
         place();
         this.width = _loc1_;
         this.height = this.state == §_-82O§.§_-F2H§ ? _loc2_ : _loc2_ - 145;
      }
   }
}

