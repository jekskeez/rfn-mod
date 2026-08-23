package §_-D2q§
{
   import §_-62p§.§_-BZ§;
   import §_-62p§.§_-HY§;
   import §_-62p§.§_-V1g§;
   import §_-62p§.§_-Vk§;
   import §_-62p§.§_-tW§;
   import §_-A2j§.§_-g1a§;
   import §_-I10§.§_-Q2v§;
   import §_-k1c§.Dialog;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-T2z§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-m1L§ extends Dialog
   {
      
      public static const §_-e13§:int = 0;
      
      public static const §_-j2r§:int = 1;
      
      public static const §_-Z2u§:int = 2;
      
      public static const VIP:int = 3;
      
      public static const §_-326§:int = 4;
      
      private static const §_-HM§:Array = [new TextFormat(§_-22V§.§_-pJ§,18,8746579),new TextFormat(§_-22V§.§_-pJ§,18,8746579),new TextFormat(§_-22V§.§_-pJ§,18,8746579)];
      
      private static var _instance:§_-m1L§ = null;
      
      private static var §_-f1p§:int = 0;
      
      private var §_-B1x§:Boolean = false;
      
      private var §_-S1g§:Vector.<§_-F1F§> = new Vector.<§_-F1F§>();
      
      private var §_-EE§:§_-G2L§;
      
      private var §_-r2n§:§_-tW§ = null;
      
      private var §_-53q§:Sprite = new Sprite();
      
      private var §_-63n§:Sprite = new Sprite();
      
      public function §_-m1L§()
      {
         super(gls("Магазин"),true,true,null,false);
         _instance = this;
         this.init();
         Connection.listen(this.§_-o2C§,[§_-S2I§.BUY]);
      }
      
      public static function get instance() : §_-m1L§
      {
         if(_instance == null)
         {
            _instance = new §_-m1L§();
         }
         return _instance;
      }
      
      public static function §_-Y1T§(param1:int = -1, param2:Boolean = true) : void
      {
         §_-f1p§ = param1;
         if(param2)
         {
            instance.show();
         }
      }
      
      public static function §_-qc§(param1:int, param2:int) : void
      {
         instance.§_-qc§(param1,param2);
      }
      
      public static function §_-k1k§() : void
      {
         instance.§_-k1k§();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(param1 != null && !this.§_-B1x§)
         {
            Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-X1A§,1);
         }
         super.hide(param1);
      }
      
      override public function show() : void
      {
         super.show();
         if(§_-f1p§ != -1)
         {
            this.§_-EE§.§_-32c§(this.§_-S1g§[§_-f1p§]);
            §_-f1p§ = -1;
         }
         Connection.§_-Li§(§_-h2B§.§_-U1o§,§_-h2B§.§_-X1A§,0);
         this.§_-B1x§ = false;
         §_-Q2v§.§_-S2y§(§_-Q2v§.§_-X1A§);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return FORMAT_CAPTION_21_CENTER;
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 5;
         this.§_-4n§ = 0;
         this.topOffset = 5;
         this.§_-JZ§ = 0;
      }
      
      private function init() : void
      {
         addChild(this.§_-53q§);
         addChild(this.§_-63n§);
         this.§_-EE§ = new §_-G2L§();
         this.§_-EE§.y = 4;
         var _loc1_:§_-F1F§ = new §_-F1F§(new §_-T2z§(gls("Акция"),§_-HM§,ButtonTabShop,8));
         this.§_-EE§.insert(_loc1_,this.§_-53q§.addChild(new §_-BZ§()));
         this.§_-S1g§.push(_loc1_);
         _loc1_ = new §_-F1F§(new §_-T2z§(gls("Костюмы"),§_-HM§,ButtonTabShop,8));
         _loc1_.x = 175;
         this.§_-EE§.insert(_loc1_,this.§_-53q§.addChild(new §_-V1g§()));
         this.§_-S1g§.push(_loc1_);
         _loc1_ = new §_-F1F§(new §_-T2z§(gls("Аксессуары"),§_-HM§,ButtonTabShop,8));
         _loc1_.x = 350;
         this.§_-EE§.insert(_loc1_,this.§_-53q§.addChild(new §_-g1a§()));
         this.§_-S1g§.push(_loc1_);
         _loc1_ = new §_-F1F§(new §_-T2z§(gls("VIP-статус"),§_-HM§,ButtonTabShop,8));
         _loc1_.x = 525;
         this.§_-EE§.insert(_loc1_,this.§_-53q§.addChild(new §_-HY§()));
         this.§_-S1g§.push(_loc1_);
         _loc1_ = new §_-F1F§(new §_-T2z§(gls("Разное"),§_-HM§,ButtonTabShop,8));
         _loc1_.x = 700;
         this.§_-EE§.insert(_loc1_,this.§_-53q§.addChild(new §_-Vk§()));
         this.§_-S1g§.push(_loc1_);
         this.§_-53q§.addChild(this.§_-EE§);
         place();
         this.width = 885;
         this.height = 600;
         this.§_-O2e§.x = 850;
         this.§_-O2e§.y += 5;
      }
      
      private function §_-qc§(param1:int, param2:int = -1) : void
      {
         this.§_-53q§.visible = false;
         this.§_-63n§.visible = true;
         if(!this.§_-r2n§)
         {
            this.§_-r2n§ = new §_-tW§(param1);
            this.§_-63n§.addChild(this.§_-r2n§);
         }
         else if(this.§_-r2n§.id != param1)
         {
            this.§_-63n§.removeChild(this.§_-r2n§);
            this.§_-r2n§ = new §_-tW§(param1);
            this.§_-63n§.addChild(this.§_-r2n§);
         }
         if(param2 != -1)
         {
            this.§_-r2n§.§_-g2Z§(param2);
         }
      }
      
      private function §_-k1k§() : void
      {
         this.§_-53q§.visible = true;
         this.§_-63n§.visible = false;
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(param1[0] == §_-S2I§.§_-k2l§)
         {
            this.§_-B1x§ = true;
         }
      }
   }
}

