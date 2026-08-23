package views
{
   import §_-68§.§_-EI§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.§_-Br§;
   import §_-I10§.§_-e1z§;
   import §_-e1G§.§_-Hb§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-x1Z§;
   import utils.§_-xb§;
   
   public class §_-lb§ extends Sprite
   {
      
      private static const §_-v1i§:String = gls("\n\n     макс. 300 энергии\n     100 маны ежедневно\n     Доступ к VIP-чату\n     Золотые крылья рядом с именем\n     х2 опыта белкой и шаманом\n     Одно бесплатное воскрешение\n     Автоматическое взятие бонуса при входе в игру");
      
      private static var instance:§_-lb§ = null;
      
      private var §_-xa§:SimpleButton = null;
      
      private var §_-v1j§:SimpleButton = null;
      
      private var §_-33I§:Sprite = null;
      
      private var §_-i1K§:§_-82e§ = null;
      
      private var §_-Eq§:§_-Hb§ = null;
      
      private var §_-T2g§:§_-Hb§ = null;
      
      private var §_-02g§:Boolean = false;
      
      public function §_-lb§()
      {
         super();
         instance = this;
         this.visible = false;
         this.§_-xa§ = new ButtonIconVIP();
         this.§_-xa§.filters = §_-Br§.§_-f2k§ ? [] : §_-x1Z§.§_-c2G§;
         this.§_-xa§.addEventListener(MouseEvent.CLICK,this.§_-v2D§);
         addChild(this.§_-xa§);
         this.§_-v1j§ = new ButtonIconDiscount();
         this.§_-v1j§.x = 30;
         addChild(this.§_-v1j§);
         this.§_-33I§ = new §_-t1N§();
         this.§_-33I§.x = 60;
         this.§_-33I§.y = 5;
         addChild(this.§_-33I§);
         this.§_-i1K§ = new §_-82e§();
         this.§_-i1K§.y = 5;
         addChild(this.§_-i1K§);
         this.§_-Eq§ = new §_-Hb§(this.§_-xa§,"",false,true);
         this.§_-Eq§.maxWidth = 290;
         this.§_-T2g§ = new §_-Hb§(this.§_-v1j§,"",false,true);
         this.§_-T2g§.maxWidth = 240;
         §_-Br§.addEventListener(GameEvent.VIP_START,this.§_-41C§);
         §_-Br§.addEventListener(GameEvent.VIP_END,this.§_-41C§);
         §_-e1z§.addEventListener(GameEvent.EXPIRATIONS_CHANGE,this.§_-v25§);
         this.§_-P1g§();
         this.§_-v25§();
         this.§_-i1i§();
         this.§_-1a§();
      }
      
      public static function §_-B2m§(param1:int) : void
      {
         if(!instance)
         {
            return;
         }
         instance.§_-i1K§.§_-A3V§(param1);
         instance.sort();
      }
      
      private function §_-41C§(param1:GameEvent) : void
      {
         this.§_-xa§.filters = §_-Br§.§_-f2k§ ? [] : §_-x1Z§.§_-c2G§;
         this.§_-P1g§();
         this.§_-i1i§();
      }
      
      private function §_-P1g§() : void
      {
         if(§_-Br§.§_-f2k§)
         {
            this.§_-Eq§.setStatus("<body><b>" + gls("VIP статус") + "</b>\n" + §_-xb§.span(gls("Активен"),"green") + ": " + §_-Br§.§_-M1D§ + §_-v1i§ + "</body>");
         }
         else
         {
            this.§_-Eq§.setStatus("<body><b>" + gls("VIP статус") + "</b>\n" + §_-xb§.span(gls("Неактивен"),"red") + §_-v1i§ + "</body>");
         }
      }
      
      private function §_-v25§(param1:Event = null) : void
      {
         var _loc2_:String = §_-e1z§.§_-po§;
         this.§_-v1j§.visible = _loc2_ != "";
         if(_loc2_ != "")
         {
            this.§_-T2g§.setStatus("<body><b>" + gls("Бонусы") + "</b>\n" + _loc2_ + "</body>");
         }
         this.sort();
         this.§_-i1i§();
      }
      
      private function §_-D1F§() : void
      {
         this.§_-P1g§();
         this.§_-v25§();
      }
      
      private function §_-i1i§() : void
      {
         var _loc1_:Boolean = §_-Br§.§_-f2k§ || §_-e1z§.§_-Hc§;
         if(this.§_-02g§ == _loc1_)
         {
            return;
         }
         this.§_-02g§ = _loc1_;
         if(_loc1_)
         {
            §_-01Y§.§_-c9§(this.§_-D1F§);
         }
         else
         {
            §_-01Y§.§_-l2K§(this.§_-D1F§);
         }
      }
      
      private function §_-v2D§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         GameSounds.play(§_-43Z§.§_-o1e§);
         §_-EI§.load(function():void
         {
            §_-m1L§.§_-Y1T§(§_-m1L§.VIP);
         });
      }
      
      private function sort() : void
      {
         this.§_-33I§.x = this.§_-v1j§.x + (this.§_-v1j§.visible ? 35 : 0) + 20;
         this.§_-i1K§.x = this.§_-33I§.x + this.§_-33I§.width - 15;
      }
      
      private function §_-1a§() : void
      {
         var _loc1_:DisplayObject = new ImageIconEnergy();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 10;
         _loc1_.y = 46;
         this.§_-Eq§.addChild(_loc1_);
         _loc1_ = new ImageIconMana();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 8;
         _loc1_.y = 60;
         this.§_-Eq§.addChild(_loc1_);
         _loc1_ = new ImageIconChat();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 10;
         _loc1_.y = 75;
         this.§_-Eq§.addChild(_loc1_);
         _loc1_ = new ImageIconGoldWing();
         _loc1_.x = 10;
         _loc1_.y = 87;
         this.§_-Eq§.addChild(_loc1_);
         _loc1_ = new ImageIconExp();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 8;
         _loc1_.y = 99;
         this.§_-Eq§.addChild(_loc1_);
         _loc1_ = new ImageIconRespawn();
         _loc1_.scaleX = _loc1_.scaleY = 0.5;
         _loc1_.x = 9;
         _loc1_.y = 115;
         this.§_-Eq§.addChild(_loc1_);
         _loc1_ = new ImageIconTime();
         _loc1_.scaleX = _loc1_.scaleY = 0.55;
         _loc1_.x = 10;
         _loc1_.y = 131;
         this.§_-Eq§.addChild(_loc1_);
      }
   }
}

