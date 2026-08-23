package §_-62p§
{
   import §_-I10§.§_-Br§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import views.§_-m23§;
   
   public class §_-HY§ extends Sprite
   {
      
      protected static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,16,16763904);
      
      protected static const §_-CD§:TextFormat = new TextFormat(null,12,6763521,true);
      
      private var §_-sM§:§_-h1U§ = null;
      
      private var §_-k18§:§_-m23§;
      
      public function §_-HY§()
      {
         super();
         this.init();
         this.y = 125;
      }
      
      private function init() : void
      {
         var _loc5_:Sprite = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:§_-22V§ = null;
         addChild(new ImageShopPotionBack()).y = -60;
         addChild(new VIPShopImage()).x = 240;
         addChild(new §_-22V§(gls("VIP-статус"),410,8,new TextFormat(§_-22V§.§_-pJ§,16,6697728,false,null,null,null,null,"center")));
         this.§_-sM§ = new §_-h1U§();
         this.§_-sM§.x = 370;
         this.§_-sM§.y = 215;
         this.§_-sM§.text = gls("Активен");
         addChild(this.§_-sM§);
         this.§_-k18§ = new §_-m23§();
         this.§_-k18§.x = 360;
         this.§_-k18§.y = 240;
         this.§_-k18§.scaleX = this.§_-k18§.scaleY = 0.9;
         addChild(this.§_-k18§);
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
            _loc7_ = new §_-22V§(_loc1_[_loc4_],_loc6_.width + 5,0,§_-CD§);
            _loc7_.wordWrap = true;
            _loc7_.width = 170;
            _loc7_.y = (_loc6_.height - _loc7_.textHeight) * 0.5 - 2;
            _loc5_.addChild(_loc7_);
            _loc4_++;
         }
         _loc3_.scaleX = _loc3_.scaleY = 0.8;
         §_-Br§.addEventListener(GameEvent.VIP_START,this.§_-41C§);
         §_-Br§.addEventListener(GameEvent.VIP_END,this.§_-41C§);
         this.§_-41C§(null);
      }
      
      private function §_-41C§(param1:GameEvent) : void
      {
         this.§_-Hp§();
         if(§_-Br§.§_-f2k§)
         {
            §_-01Y§.§_-c9§(this.§_-Hp§);
         }
         else
         {
            §_-01Y§.§_-l2K§(this.§_-Hp§);
         }
      }
      
      private function §_-Hp§() : void
      {
         this.§_-sM§.visible = §_-Br§.§_-f2k§;
         this.§_-sM§.value = §_-Br§.§_-M1D§;
      }
   }
}

