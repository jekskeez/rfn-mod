package §_-k1c§
{
   import §_-D2q§.§_-M2D§;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-P2b§.§_-6L§;
   import §_-d10§.§_-e1N§;
   import §_-e1G§.§_-o2m§;
   import §_-r2Y§.§_-33e§;
   import §_-s2u§.§_-a1V§;
   import §_-z2Z§.§_-O1D§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import tape.§_-91w§;
   import tape.§_-A3s§;
   import tape.§_-wP§;
   import utils.§_-jB§;
   import utils.§_-qF§;
   import utils.§_-xb§;
   
   public class §_-qb§ extends Dialog
   {
      
      private static var _instance:§_-qb§ = null;
      
      private var §_-qW§:int = 0;
      
      private var §_-gR§:§_-wP§ = null;
      
      private var §_-T1j§:§_-22V§ = null;
      
      private var §_-n2P§:§_-22V§ = null;
      
      private var §_-h1V§:§_-j18§ = null;
      
      private var buttonBuy:§_-j18§ = null;
      
      private var §_-Z1B§:DisplayObject = null;
      
      private var §_-c1u§:§_-e1N§ = null;
      
      private var back:Sprite = null;
      
      private var §_-b1h§:Sprite = null;
      
      private var §_-V1C§:DisplayObject = null;
      
      private var §_-Z1a§:§_-o2m§ = null;
      
      public function §_-qb§()
      {
         super(gls("Книга заклинаний"),true,true,null,false);
         this.init();
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-Hp§);
      }
      
      public static function show(param1:int) : void
      {
         if(!_instance)
         {
            _instance = new §_-qb§();
         }
         _instance.§_-23I§(param1);
         _instance.show();
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return FORMAT_CAPTION_23_CENTER;
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-R1Y§ = 5;
         this.§_-4n§ = 5;
         this.topOffset = 10;
         this.§_-JZ§ = 0;
      }
      
      public function §_-23I§(param1:int) : void
      {
         this.§_-qW§ = param1;
         this.update();
      }
      
      private function init() : void
      {
         this.back = new DialogExtraPerkBack();
         addChild(this.back);
         this.§_-c1u§ = new §_-e1N§();
         this.§_-c1u§.x = 577;
         this.§_-c1u§.y = 36;
         addChild(this.§_-c1u§);
         this.§_-T1j§ = new §_-22V§("",520,0,new TextFormat(§_-22V§.§_-F2z§,20,6697728,true,null,null,null,null,"center"),290);
         addChild(this.§_-T1j§);
         this.§_-n2P§ = new §_-22V§("",520,225,new TextFormat(§_-22V§.§_-F2z§,12,6697728,false,null,null,null,null,"center"),290);
         addChild(this.§_-n2P§);
         this.§_-h1V§ = new §_-j18§(gls("Применить"));
         this.§_-h1V§.x = 520 + int((290 - this.§_-h1V§.width) * 0.5);
         this.§_-h1V§.y = 300;
         this.§_-h1V§.visible = false;
         this.§_-h1V§.addEventListener(MouseEvent.CLICK,this.select);
         addChild(this.§_-h1V§);
         this.buttonBuy = new §_-j18§("");
         this.buttonBuy.x = 520 + int((290 - this.buttonBuy.width) * 0.5);
         this.buttonBuy.y = 300;
         this.buttonBuy.visible = false;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         addChild(this.buttonBuy);
         this.§_-b1h§ = new Sprite();
         this.§_-b1h§.x = 520;
         this.§_-b1h§.y = 340;
         this.§_-b1h§.visible = false;
         this.§_-b1h§.addChild(new §_-22V§(gls("Для доступа к магии необходим костюм:"),0,0,new TextFormat(§_-22V§.§_-F2z§,12,6697728,false,null,null,null,null,"center"),290));
         addChild(this.§_-b1h§);
         place();
         this.height += 40;
         this.§_-O2e§.x -= 20;
         this.§_-zl§.y -= 5;
      }
      
      private function update() : void
      {
         var _loc6_:§_-A3s§ = null;
         var _loc1_:int = §_-g2W§.§_-X2e§(this.§_-qW§);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < §_-g2W§.§_-G1k§)
         {
            if(§_-g2W§.§_-Ca§.indexOf(_loc3_) == -1)
            {
               if(_loc3_ != _loc1_)
               {
                  _loc2_ = _loc2_.concat(§_-g2W§.§_-433§(_loc3_));
               }
            }
            _loc3_++;
         }
         _loc2_ = §_-qF§.§_-yi§(_loc2_.filter(§_-g2W§.§_-42y§));
         if(this.§_-gR§)
         {
            removeChild(this.§_-gR§);
         }
         this.§_-gR§ = new §_-wP§(6,6,0,15,20,20,40,40,true,true);
         this.§_-gR§.x = 90;
         this.§_-gR§.y = 15;
         var _loc4_:§_-91w§ = new §_-91w§(§_-a1V§);
         _loc4_.setData(_loc2_);
         this.§_-gR§.setData(_loc4_);
         this.§_-gR§.addEventListener(§_-33e§.SELECTED,this.§_-91N§);
         addChild(this.§_-gR§);
         var _loc5_:int = §_-h1f§.§_-Eo§(this.§_-qW§);
         if(_loc5_ != 0)
         {
            for each(_loc6_ in this.§_-gR§.§_-H1Q§().objects)
            {
               if(_loc6_.id == _loc5_)
               {
                  this.§_-gR§.select(_loc6_);
                  (_loc6_ as §_-a1V§).active = true;
                  break;
               }
            }
         }
         this.§_-gR§.§_-d1n§.§_-Q1A§.visible = false;
         this.§_-gR§.§_-d1n§.§_-Q1A§ = (this.back as DialogExtraPerkBack).buttonPrev;
         this.§_-gR§.§_-d1n§.§_-Q1A§.addEventListener(MouseEvent.CLICK,this.§_-gR§.§_-d1n§.§_-yb§);
         this.§_-gR§.§_-d1n§.§_-NT§.visible = false;
         this.§_-gR§.§_-d1n§.§_-NT§ = (this.back as DialogExtraPerkBack).buttonNext;
         this.§_-gR§.§_-d1n§.§_-NT§.addEventListener(MouseEvent.CLICK,this.§_-gR§.§_-d1n§.§_-yb§);
      }
      
      private function §_-Hp§(param1:GameEvent) : void
      {
         var _loc2_:§_-a1V§ = null;
         this.§_-gR§.select(this.§_-gR§.§_-Y1y§);
         for each(_loc2_ in this.§_-gR§.§_-H1Q§().objects)
         {
            _loc2_.§_-yu§();
         }
      }
      
      private function §_-91N§(param1:§_-33e§) : void
      {
         if(this.§_-gR§.§_-Y1y§ == null)
         {
            return;
         }
         this.§_-T1j§.text = §_-6L§.getName(this.§_-gR§.§_-Y1y§.id);
         this.§_-n2P§.text = §_-6L§.§_-l7§(this.§_-gR§.§_-Y1y§.id);
         if(this.§_-Z1B§)
         {
            this.back.removeChild(this.§_-Z1B§);
         }
         this.§_-Z1B§ = §_-6L§.§_-Gi§(this.§_-gR§.§_-Y1y§.id);
         this.§_-Z1B§.width = this.§_-Z1B§.height = 95;
         this.§_-Z1B§.x = int(620 + this.§_-Z1B§.width * 0.5);
         this.§_-Z1B§.y = int(77 + this.§_-Z1B§.height * 0.5);
         this.back.addChild(this.§_-Z1B§);
         this.§_-c1u§.load(this.§_-gR§.§_-Y1y§.id,§_-e1N§.§_-Va§);
         var _loc2_:int = §_-g2W§.§_-N2b§(this.§_-gR§.§_-Y1y§.id);
         var _loc3_:int = §_-g2W§.§_-s1h§(_loc2_);
         var _loc4_:Boolean = §_-h1f§.§_-i21§(_loc3_,§_-h1f§.§_-A3r§) && §_-h1f§.§_-i21§(_loc2_,§_-h1f§.§_-A3r§);
         var _loc5_:Boolean = !§_-h1f§.§_-i21§(_loc3_,§_-h1f§.§_-A3r§) && §_-h1f§.§_-i21§(_loc2_,§_-h1f§.§_-A3r§);
         this.§_-h1V§.visible = _loc4_;
         this.buttonBuy.visible = !_loc4_;
         this.§_-b1h§.visible = !_loc4_;
         if(_loc5_)
         {
            _loc2_ = _loc3_;
         }
         if(this.buttonBuy.visible)
         {
            this.buttonBuy.clear();
            this.buttonBuy.field.text = gls("Купить за {0}",§_-g2W§.getPackageCoinsPrice(_loc2_)) + " - ";
            this.buttonBuy.redraw();
            this.buttonBuy.x = 520 + int((290 - this.buttonBuy.width) * 0.5);
            §_-jB§.§_-fG§(this.buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
         }
         if(this.§_-Z1a§)
         {
            this.§_-Z1a§.remove();
         }
         if(this.§_-b1h§.visible)
         {
            if(this.§_-V1C§)
            {
               this.§_-b1h§.removeChild(this.§_-V1C§);
            }
            this.§_-V1C§ = new §_-O1D§(_loc2_);
            this.§_-V1C§.x = 115;
            this.§_-V1C§.y = 20;
            this.§_-b1h§.addChild(this.§_-V1C§);
            this.§_-Z1a§ = new §_-o2m§(this.§_-V1C§,"<body><b><span class = \'center\'>" + §_-xb§.span(§_-g2W§.§_-G1Y§(_loc2_),"green") + "</span></b><br/>" + §_-g2W§.§_-81F§(_loc2_) + "</body>");
         }
      }
      
      private function select(param1:MouseEvent) : void
      {
         Connection.§_-Li§(§_-h2B§.§_-z25§,this.§_-qW§,this.§_-gR§.§_-Y1y§.id);
         hide();
      }
      
      private function buy(param1:MouseEvent) : void
      {
         var _loc2_:int = §_-g2W§.§_-N2b§(this.§_-gR§.§_-Y1y§.id);
         var _loc3_:int = §_-g2W§.§_-s1h§(_loc2_);
         if(!§_-h1f§.§_-i21§(_loc3_,§_-h1f§.§_-A3r§) && §_-h1f§.§_-i21§(_loc2_,§_-h1f§.§_-A3r§))
         {
            _loc2_ = _loc3_;
         }
         if(§_-g2W§.§_-CZ§(_loc2_))
         {
            Game.§_-K2t§(§_-h2B§.§_-a2Z§,§_-g2W§.getPackageCoinsPrice(_loc2_),0,Game.selfId,_loc2_);
         }
         else if(§_-h1f§.§_-x1C§(§_-g2W§.§_-s1h§(_loc2_)))
         {
            Game.§_-K2t§(§_-h2B§.§_-m1U§,§_-g2W§.getPackageCoinsPrice(_loc2_),0,Game.selfId,_loc2_);
         }
         else
         {
            §_-M2D§.show(_loc2_);
         }
      }
   }
}

