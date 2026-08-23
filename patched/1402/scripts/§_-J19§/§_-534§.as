package §_-J19§
{
   import §_-K1§.§_-42U§;
   import §_-K1§.§_-91n§;
   import §_-K1§.§_-G1z§;
   import §_-K1§.§_-K1H§;
   import §_-K1§.§_-o1v§;
   import §_-X1k§.§_-Ac§;
   import §_-bN§.Dialog;
   import §_-q24§.§_-Uu§;
   import buttons.§_-Hg§;
   import buttons.§_-Q1W§;
   import buttons.§_-uH§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-534§ extends Dialog
   {
      
      public static const §_-Vq§:int = 0;
      
      public static const §_-jN§:int = 1;
      
      public static const §_-l1s§:int = 2;
      
      public static const VIP:int = 3;
      
      public static const §_-22n§:int = 4;
      
      private static const §_-D12§:Array = [new TextFormat(§_-i5§.§_-p1s§,18,8746579),new TextFormat(§_-i5§.§_-p1s§,18,8746579),new TextFormat(§_-i5§.§_-p1s§,18,8746579)];
      
      private static var _instance:§_-534§ = null;
      
      private static var §_-b1§:int = 0;
      
      private var §_-j1H§:Boolean = false;
      
      private var §_-Up§:Vector.<§_-uH§> = new Vector.<§_-uH§>();
      
      private var §_-S8§:§_-Hg§;
      
      private var §_-h1j§:§_-G1z§ = null;
      
      private var §_-Px§:Sprite = new Sprite();
      
      private var §_-s1J§:Sprite = new Sprite();
      
      public function §_-534§()
      {
         super(gls("Магазин"),true,true,null,false);
         _instance = this;
         this.init();
         Connection.listen(this.§_-x2f§,[§_-s2l§.BUY]);
      }
      
      public static function get instance() : §_-534§
      {
         if(_instance == null)
         {
            _instance = new §_-534§();
         }
         return _instance;
      }
      
      public static function §_-R2X§(param1:int = -1, param2:Boolean = true) : void
      {
         §_-b1§ = param1;
         if(param2)
         {
            instance.show();
         }
      }
      
      public static function §_-115§(param1:int, param2:int) : void
      {
         instance.§_-115§(param1,param2);
      }
      
      public static function §_-C2M§() : void
      {
         instance.§_-C2M§();
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         if(param1 != null && !this.§_-j1H§)
         {
            Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-K2A§,1);
         }
         super.hide(param1);
      }
      
      override public function show() : void
      {
         super.show();
         if(§_-b1§ != -1)
         {
            this.§_-S8§.§_-l1Y§(this.§_-Up§[§_-b1§]);
            §_-b1§ = -1;
         }
         Connection.§_-e2T§(§_-u1O§.§_-Ea§,§_-u1O§.§_-K2A§,0);
         this.§_-j1H§ = false;
         §_-Ac§.§_-91§(§_-Ac§.§_-K2A§);
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return FORMAT_CAPTION_21_CENTER;
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 5;
         this.§_-7N§ = 0;
         this.topOffset = 5;
         this.§_-f2d§ = 0;
      }
      
      private function init() : void
      {
         addChild(this.§_-Px§);
         addChild(this.§_-s1J§);
         this.§_-S8§ = new §_-Hg§();
         this.§_-S8§.y = 4;
         var _loc1_:§_-uH§ = new §_-uH§(new §_-Q1W§(gls("Акция"),§_-D12§,ButtonTabShop,8));
         this.§_-S8§.insert(_loc1_,this.§_-Px§.addChild(new §_-K1H§()));
         this.§_-Up§.push(_loc1_);
         _loc1_ = new §_-uH§(new §_-Q1W§(gls("Костюмы"),§_-D12§,ButtonTabShop,8));
         _loc1_.x = 175;
         this.§_-S8§.insert(_loc1_,this.§_-Px§.addChild(new §_-o1v§()));
         this.§_-Up§.push(_loc1_);
         _loc1_ = new §_-uH§(new §_-Q1W§(gls("Аксессуары"),§_-D12§,ButtonTabShop,8));
         _loc1_.x = 350;
         this.§_-S8§.insert(_loc1_,this.§_-Px§.addChild(new §_-Uu§()));
         this.§_-Up§.push(_loc1_);
         _loc1_ = new §_-uH§(new §_-Q1W§(gls("VIP-статус"),§_-D12§,ButtonTabShop,8));
         _loc1_.x = 525;
         this.§_-S8§.insert(_loc1_,this.§_-Px§.addChild(new §_-91n§()));
         this.§_-Up§.push(_loc1_);
         _loc1_ = new §_-uH§(new §_-Q1W§(gls("Разное"),§_-D12§,ButtonTabShop,8));
         _loc1_.x = 700;
         this.§_-S8§.insert(_loc1_,this.§_-Px§.addChild(new §_-42U§()));
         this.§_-Up§.push(_loc1_);
         this.§_-Px§.addChild(this.§_-S8§);
         place();
         this.width = 885;
         this.height = 600;
         this.§_-x2T§.x = 850;
         this.§_-x2T§.y += 5;
      }
      
      private function §_-115§(param1:int, param2:int = -1) : void
      {
         this.§_-Px§.visible = false;
         this.§_-s1J§.visible = true;
         if(!this.§_-h1j§)
         {
            this.§_-h1j§ = new §_-G1z§(param1);
            this.§_-s1J§.addChild(this.§_-h1j§);
         }
         else if(this.§_-h1j§.id != param1)
         {
            this.§_-s1J§.removeChild(this.§_-h1j§);
            this.§_-h1j§ = new §_-G1z§(param1);
            this.§_-s1J§.addChild(this.§_-h1j§);
         }
         if(param2 != -1)
         {
            this.§_-h1j§.§_-6e§(param2);
         }
      }
      
      private function §_-C2M§() : void
      {
         this.§_-Px§.visible = true;
         this.§_-s1J§.visible = false;
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         if(param1[0] == §_-s2l§.§_-v1E§)
         {
            this.§_-j1H§ = true;
         }
      }
   }
}

