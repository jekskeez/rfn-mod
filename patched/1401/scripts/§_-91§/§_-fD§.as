package §_-91§
{
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import utils.StringUtil;
   import utils.§_-N1w§;
   import utils.§_-x1Z§;
   import views.§_-S1U§;
   
   public class §_-fD§ extends Dialog
   {
      
      private static const §_-i2c§:TextFormat = new TextFormat(null,18,6697728,true,null,null,null,null,"center");
      
      private static const §_-5i§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,24,2211605);
      
      private static const §_-9x§:Array = [gls("Твой результат за прошлый сезон:"),gls("Результат клана за прошлый сезон:")];
      
      private static const §_-23t§:Array = [gls("Тебе не удалось\nпопасть в лигу"),gls("Вам не удалось\nпопасть в лигу")];
      
      private static const §_-U2W§:Array = [gls("Тебе удалось\nпопасть в лигу"),gls("Вам удалось\nпопасть в лигу")];
      
      private static const §_-B3W§:Array = [gls("В новом сезоне ты получаешь"),gls("В новом сезоне вы получаете")];
      
      private static const §_-22L§:Array = [gls("Ты не участвовал\nв прошлом сезоне.\nВ новом сезоне ты\nне получаешь\nбонусных очков."),gls("Вы не участвовали\nв прошлом сезоне.\nВ новом сезоне вы\nне получаете\nбонусных очков.")];
      
      private static const §_-x2T§:GlowFilter = new GlowFilter(16777215,1,4,4,8);
      
      private static const §_-p25§:DropShadowFilter = new DropShadowFilter(2,45,0,1,2,2,0.25);
      
      private var type:int = 0;
      
      private var state:int = 0;
      
      private var value:int = 0;
      
      public function §_-fD§(param1:int = 0, param2:int = -1, param3:int = 0)
      {
         super(gls("Итоги сезона"));
         this.type = param3;
         this.state = param1;
         this.value = param2 != -1 ? param2 : §_-13r§.§_-i1Z§(this.type == §_-13r§.CLAN_TYPE ? §_-e2W§.§_-W2X§(Game.self["clan_id"]).§_-A1h§ : Game.self["rating_history"]);
         this.init();
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
         var _loc5_:§_-22V§ = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:§_-S1U§ = null;
         var _loc9_:Sprite = null;
         var _loc1_:int = 400;
         var _loc2_:int = 370;
         var _loc3_:MovieClip = new RatingChampionAnimation();
         _loc3_.scaleX = _loc3_.scaleY = 7;
         _loc3_.x = int(_loc1_ * 0.5);
         _loc3_.y = 90;
         addChild(_loc3_);
         _loc3_.gotoAndStop(_loc3_.totalFrames - 1);
         §_-N1w§.§_-s2c§(_loc3_);
         _loc3_.filters = §_-x1Z§.§_-c2G§;
         _loc3_.alpha = 0.1;
         switch(this.state)
         {
            case §_-13r§.§_-l14§:
               _loc5_ = new §_-22V§(§_-9x§[this.type],0,10,§_-i2c§);
               _loc5_.x = int((_loc1_ - _loc5_.textWidth) * 0.5);
               addChild(_loc5_);
               _loc6_ = int(this.value * §_-13r§.§_-1I§);
               _loc7_ = §_-13r§.§_-K1M§(this.value,this.type);
               _loc8_ = new §_-S1U§(_loc7_,3.5);
               _loc8_.x = 105;
               _loc8_.y = 100;
               addChild(_loc8_);
               if(_loc7_ == 0)
               {
                  addChild(new §_-22V§(§_-23t§[this.type],210,80,§_-i2c§));
               }
               else
               {
                  addChild(new §_-22V§(§_-U2W§[this.type],210,60,§_-i2c§));
                  _loc5_ = new §_-22V§(§_-8S§.§_-11s§(_loc7_,this.type),0,103,§_-5i§);
                  _loc5_.x = 75 + int((_loc1_ - _loc5_.textWidth) * 0.5);
                  _loc5_.filters = [§_-x2T§,§_-p25§];
                  addChild(_loc5_);
               }
               _loc9_ = new Sprite();
               _loc9_.graphics.beginFill(10053171,0.1);
               _loc9_.graphics.drawRoundRectComplex(0,190,_loc1_,_loc2_ - 230,0,0,5,5);
               addChild(_loc9_);
               _loc5_ = new §_-22V§(§_-B3W§[this.type],0,200,§_-i2c§);
               _loc5_.x = int((_loc1_ - _loc5_.textWidth) * 0.5);
               addChild(_loc5_);
               _loc5_ = new §_-22V§(_loc6_.toString(),0,225,§_-5i§);
               _loc5_.x = int((_loc1_ - _loc5_.textWidth) * 0.5) - 3;
               _loc5_.filters = [§_-x2T§,§_-p25§];
               addChild(_loc5_);
               _loc5_ = new §_-22V§(StringUtil.word("бонусное очко",_loc6_),0,255,§_-i2c§);
               _loc5_.x = int((_loc1_ - _loc5_.textWidth) * 0.5);
               addChild(_loc5_);
               break;
            case §_-13r§.§_-C2f§:
               _loc8_ = new §_-S1U§(0,3.5);
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
               _loc5_ = new §_-22V§(§_-22L§[this.type],180,10,§_-i2c§);
               addChild(_loc5_);
         }
         var _loc4_:§_-j18§ = new §_-j18§(gls("Ок"));
         _loc4_.x = int((_loc1_ - _loc4_.width) * 0.5);
         _loc4_.y = this.state == §_-13r§.§_-l14§ ? 295 : 150;
         _loc4_.addEventListener(MouseEvent.CLICK,hide);
         addChild(_loc4_);
         place();
         this.width = _loc1_;
         this.height = this.state == §_-13r§.§_-l14§ ? _loc2_ : _loc2_ - 145;
      }
   }
}

