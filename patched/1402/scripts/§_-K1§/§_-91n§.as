package §_-K1§
{
   import §_-X1k§.§_-F1Z§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import views.§_-q2a§;
   
   public class §_-91n§ extends Sprite
   {
      
      protected static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,16,16763904);
      
      protected static const §_-C1Q§:TextFormat = new TextFormat(null,12,6763521,true);
      
      private var §_-Ut§:§_-s2v§ = null;
      
      private var §_-op§:§_-q2a§;
      
      public function §_-91n§()
      {
         super();
         this.init();
         this.y = 125;
      }
      
      private function init() : void
      {
         var _loc5_:Sprite = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:§_-i5§ = null;
         addChild(new ImageShopPotionBack()).y = -60;
         addChild(new VIPShopImage()).x = 240;
         addChild(new §_-i5§(gls("VIP-статус"),410,8,new TextFormat(§_-i5§.§_-p1s§,16,6697728,false,null,null,null,null,"center")));
         this.§_-Ut§ = new §_-s2v§();
         this.§_-Ut§.x = 370;
         this.§_-Ut§.y = 215;
         this.§_-Ut§.text = gls("Активен");
         addChild(this.§_-Ut§);
         this.§_-op§ = new §_-q2a§();
         this.§_-op§.x = 360;
         this.§_-op§.y = 240;
         this.§_-op§.scaleX = this.§_-op§.scaleY = 0.9;
         addChild(this.§_-op§);
         var _loc1_:Array = [gls("Восстановление энергии\nдо максимума"),gls("+100 маны ежедневно"),gls("Макс. энергия 300\nВосполнение 2 эн./мин."),gls("Доступ к чату VIP игроков"),gls("Золотые крылья рядом с именем"),gls("Одно бесплатное воскрешение на раунде"),gls("х2 скорость получения опыта белкой и шаманом"),gls("Автоматическое взятие бонуса при входе в игру")];
         var _loc2_:Array = [ImageGetEnergyRefill,ImageGetMana100Regen,ImageGetEnergy300Max,ImageGetChat,ImageGetVipView,ImageGetReborn,ImageGetDoubleExp,ImageGetAutotakeBonus];
         var _loc3_:Sprite = new Sprite();
         _loc3_.x = 80;
         _loc3_.y = 340;
         addChild(_loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc5_ = new Sprite();
            _loc5_.x = _loc4_ % 4 * 230;
            _loc5_.y = int(_loc4_ / 4) * 60;
            _loc3_.addChild(_loc5_);
            _loc6_ = new _loc2_[_loc4_]();
            _loc5_.addChild(_loc6_);
            _loc7_ = new §_-i5§(_loc1_[_loc4_],_loc6_.width + 5,0,§_-C1Q§);
            _loc7_.wordWrap = true;
            _loc7_.width = 170;
            _loc7_.y = (_loc6_.height - _loc7_.textHeight) * 0.5 - 2;
            _loc5_.addChild(_loc7_);
            _loc4_++;
         }
         _loc3_.scaleX = _loc3_.scaleY = 0.8;
         §_-F1Z§.addEventListener(GameEvent.VIP_START,this.§_-bI§);
         §_-F1Z§.addEventListener(GameEvent.VIP_END,this.§_-bI§);
         this.§_-bI§(null);
      }
      
      private function §_-bI§(param1:GameEvent) : void
      {
         this.§_-w1T§();
         if(§_-F1Z§.§_-O1u§)
         {
            §_-p1V§.§_-63T§(this.§_-w1T§);
         }
         else
         {
            §_-p1V§.§_-B3x§(this.§_-w1T§);
         }
      }
      
      private function §_-w1T§() : void
      {
         this.§_-Ut§.visible = §_-F1Z§.§_-O1u§;
         this.§_-Ut§.value = §_-F1Z§.§_-j1x§;
      }
   }
}

