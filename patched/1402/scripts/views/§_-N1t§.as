package views
{
   import §_-J19§.§_-534§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-F1Z§;
   import §_-X1k§.§_-ku§;
   import §_-s2e§.§_-U2d§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-r1G§;
   import utils.§_-y1l§;
   
   public class §_-N1t§ extends Sprite
   {
      
      private static const §_-61W§:String = gls("\n\n     макс. 300 энергии\n     100 маны ежедневно\n     Доступ к VIP-чату\n     Золотые крылья рядом с именем\n     х2 опыта белкой и шаманом\n     Одно бесплатное воскрешение\n     Автоматическое взятие бонуса при входе в игру");
      
      private static var instance:§_-N1t§ = null;
      
      private var §_-J1j§:SimpleButton = null;
      
      private var §_-n1F§:SimpleButton = null;
      
      private var §_-I2t§:Sprite = null;
      
      private var §_-U1Y§:§_-83x§ = null;
      
      private var §_-e2o§:§_-kr§ = null;
      
      private var §_-X2u§:§_-kr§ = null;
      
      private var §_-b2E§:Boolean = false;
      
      public function §_-N1t§()
      {
         super();
         instance = this;
         this.visible = false;
         this.§_-J1j§ = new ButtonIconVIP();
         this.§_-J1j§.filters = §_-F1Z§.§_-O1u§ ? [] : §_-y1l§.§_-Tk§;
         this.§_-J1j§.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(this.§_-J1j§);
         this.§_-n1F§ = new ButtonIconDiscount();
         this.§_-n1F§.x = 30;
         addChild(this.§_-n1F§);
         this.§_-I2t§ = new §_-63U§();
         this.§_-I2t§.x = 60;
         this.§_-I2t§.y = 5;
         addChild(this.§_-I2t§);
         this.§_-U1Y§ = new §_-83x§();
         this.§_-U1Y§.y = 5;
         addChild(this.§_-U1Y§);
         this.§_-e2o§ = new §_-kr§(this.§_-J1j§,"",false,true);
         this.§_-e2o§.maxWidth = 290;
         this.§_-X2u§ = new §_-kr§(this.§_-n1F§,"",false,true);
         this.§_-X2u§.maxWidth = 240;
         §_-F1Z§.addEventListener(GameEvent.VIP_START,this.§_-bI§);
         §_-F1Z§.addEventListener(GameEvent.VIP_END,this.§_-bI§);
         §_-ku§.addEventListener(GameEvent.EXPIRATIONS_CHANGE,this.§_-Cy§);
         this.§_-51y§();
         this.§_-Cy§();
         this.§_-C3S§();
         this.§_-Uh§();
      }
      
      public static function §_-b25§(param1:int) : void
      {
         if(!instance)
         {
            return;
         }
         instance.§_-U1Y§.§_-yB§(param1);
         instance.sort();
      }
      
      private function §_-bI§(param1:GameEvent) : void
      {
         this.§_-J1j§.filters = §_-F1Z§.§_-O1u§ ? [] : §_-y1l§.§_-Tk§;
         this.§_-51y§();
         this.§_-C3S§();
      }
      
      private function §_-51y§() : void
      {
         if(§_-F1Z§.§_-O1u§)
         {
            this.§_-e2o§.setStatus("<body><b>" + gls("VIP статус") + "</b>\n" + §_-r1G§.span(gls("Активен"),"green") + ": " + §_-F1Z§.§_-j1x§ + §_-61W§ + "</body>");
         }
         else
         {
            this.§_-e2o§.setStatus("<body><b>" + gls("VIP статус") + "</b>\n" + §_-r1G§.span(gls("Неактивен"),"red") + §_-61W§ + "</body>");
         }
      }
      
      private function §_-Cy§(param1:Event = null) : void
      {
         var _loc2_:String = §_-ku§.§_-e1n§;
         this.§_-n1F§.visible = _loc2_ != "";
         if(_loc2_ != "")
         {
            this.§_-X2u§.setStatus("<body><b>" + gls("Бонусы") + "</b>\n" + _loc2_ + "</body>");
         }
         this.sort();
         this.§_-C3S§();
      }
      
      private function §_-r28§() : void
      {
         this.§_-51y§();
         this.§_-Cy§();
      }
      
      private function §_-C3S§() : void
      {
         var _loc1_:Boolean = §_-F1Z§.§_-O1u§ || §_-ku§.§_-wi§;
         if(this.§_-b2E§ == _loc1_)
         {
            return;
         }
         this.§_-b2E§ = _loc1_;
         if(_loc1_)
         {
            §_-p1V§.§_-63T§(this.§_-r28§);
         }
         else
         {
            §_-p1V§.§_-B3x§(this.§_-r28§);
         }
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         GameSounds.play(§_-RH§.§_-K10§);
         §_-U2d§.load(function():void
         {
            §_-534§.§_-R2X§(§_-534§.VIP);
         });
      }
      
      private function sort() : void
      {
         this.§_-I2t§.x = this.§_-n1F§.x + (this.§_-n1F§.visible ? 35 : 0) + 20;
         this.§_-U1Y§.x = this.§_-I2t§.x + this.§_-I2t§.width - 15;
      }
      
      private function §_-Uh§() : void
      {
         var _loc1_:DisplayObject = new ImageIconEnergy();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 10;
         _loc1_.y = 46;
         this.§_-e2o§.addChild(_loc1_);
         _loc1_ = new ImageIconMana();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 8;
         _loc1_.y = 60;
         this.§_-e2o§.addChild(_loc1_);
         _loc1_ = new ImageIconChat();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 10;
         _loc1_.y = 75;
         this.§_-e2o§.addChild(_loc1_);
         _loc1_ = new ImageIconGoldWing();
         _loc1_.x = 10;
         _loc1_.y = 87;
         this.§_-e2o§.addChild(_loc1_);
         _loc1_ = new ImageIconExp();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 8;
         _loc1_.y = 99;
         this.§_-e2o§.addChild(_loc1_);
         _loc1_ = new ImageIconRespawn();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 9;
         _loc1_.y = 115;
         this.§_-e2o§.addChild(_loc1_);
         _loc1_ = new ImageIconTime();
         _loc1_.scaleX = _loc1_.scaleY = 0.55;
         _loc1_.x = 10;
         _loc1_.y = 131;
         this.§_-e2o§.addChild(_loc1_);
      }
   }
}

