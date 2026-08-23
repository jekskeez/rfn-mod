package §_-bN§
{
   import §_-J19§.§_-B26§;
   import §_-J21§.§_-T1g§;
   import §_-Qy§.§_-Ms§;
   import §_-S1n§.§_-f0§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-a11§.§_-h2m§;
   import §_-j2E§.§_-A11§;
   import §_-z2V§.§_-E1M§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import tape.§_-2n§;
   import tape.§_-S1M§;
   import tape.§_-o2N§;
   import utils.§_-K1Y§;
   import utils.§_-cx§;
   import utils.§_-r1G§;
   
   public class §_-Uj§ extends Dialog
   {
      
      private static var _instance:§_-Uj§ = null;
      
      private var §_-nb§:int = 0;
      
      private var §_-hc§:§_-S1M§ = null;
      
      private var §_-Q1w§:§_-i5§ = null;
      
      private var §_-Z11§:§_-i5§ = null;
      
      private var §_-k2v§:§_-K2G§ = null;
      
      private var buttonBuy:§_-K2G§ = null;
      
      private var §_-r2S§:DisplayObject = null;
      
      private var §_-8N§:§_-Ms§ = null;
      
      private var back:Sprite = null;
      
      private var §_-62X§:Sprite = null;
      
      private var §_-72l§:DisplayObject = null;
      
      private var §_-G2f§:§_-f0§ = null;
      
      public function §_-Uj§()
      {
         super(gls("Книга заклинаний"),true,true,null,false);
         this.init();
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-w1T§);
      }
      
      public static function show(param1:int) : void
      {
         if(!_instance)
         {
            _instance = new §_-Uj§();
         }
         _instance.§_-83c§(param1);
         _instance.show();
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return FORMAT_CAPTION_23_CENTER;
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 5;
         this.§_-7N§ = 5;
         this.topOffset = 10;
         this.§_-f2d§ = 0;
      }
      
      public function §_-83c§(param1:int) : void
      {
         this.§_-nb§ = param1;
         this.update();
      }
      
      private function init() : void
      {
         this.back = new DialogExtraPerkBack();
         addChild(this.back);
         this.§_-8N§ = new §_-Ms§();
         this.§_-8N§.x = 577;
         this.§_-8N§.y = 36;
         addChild(this.§_-8N§);
         this.§_-Q1w§ = new §_-i5§("",520,0,new TextFormat(§_-i5§.§_-c10§,20,6697728,true,null,null,null,null,"center"),290);
         addChild(this.§_-Q1w§);
         this.§_-Z11§ = new §_-i5§("",520,225,new TextFormat(§_-i5§.§_-c10§,12,6697728,false,null,null,null,null,"center"),290);
         addChild(this.§_-Z11§);
         this.§_-k2v§ = new §_-K2G§(gls("Применить"));
         this.§_-k2v§.x = 520 + int((290 - this.§_-k2v§.width) * 0.5);
         this.§_-k2v§.y = 300;
         this.§_-k2v§.visible = false;
         this.§_-k2v§.addEventListener(MouseEvent.CLICK,this.select);
         addChild(this.§_-k2v§);
         this.buttonBuy = new §_-K2G§("");
         this.buttonBuy.x = 520 + int((290 - this.buttonBuy.width) * 0.5);
         this.buttonBuy.y = 300;
         this.buttonBuy.visible = false;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.buy);
         addChild(this.buttonBuy);
         this.§_-62X§ = new Sprite();
         this.§_-62X§.x = 520;
         this.§_-62X§.y = 340;
         this.§_-62X§.visible = false;
         this.§_-62X§.addChild(new §_-i5§(gls("Для доступа к магии необходим костюм:"),0,0,new TextFormat(§_-i5§.§_-c10§,12,6697728,false,null,null,null,null,"center"),290));
         addChild(this.§_-62X§);
         place();
         this.height += 40;
         this.§_-x2T§.x -= 20;
         this.§_-Y1T§.y -= 5;
      }
      
      private function update() : void
      {
         var _loc6_:§_-2n§ = null;
         var _loc1_:int = §_-P2x§.§_-b2c§(this.§_-nb§);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < §_-P2x§.§_-i1e§)
         {
            if(§_-P2x§.§_-z2L§.indexOf(_loc3_) == -1)
            {
               if(_loc3_ != _loc1_)
               {
                  _loc2_ = _loc2_.concat(§_-P2x§.§_-T§(_loc3_));
               }
            }
            _loc3_++;
         }
         _loc2_ = §_-cx§.§_-y1Z§(_loc2_.filter(§_-P2x§.§_-y2T§));
         if(this.§_-hc§)
         {
            removeChild(this.§_-hc§);
         }
         this.§_-hc§ = new §_-S1M§(6,6,0,15,20,20,40,40,true,true);
         this.§_-hc§.x = 90;
         this.§_-hc§.y = 15;
         var _loc4_:§_-o2N§ = new §_-o2N§(§_-T1g§);
         _loc4_.setData(_loc2_);
         this.§_-hc§.setData(_loc4_);
         this.§_-hc§.addEventListener(§_-h2m§.SELECTED,this.§_-h1u§);
         addChild(this.§_-hc§);
         var _loc5_:int = §_-L1o§.§_-31E§(this.§_-nb§);
         if(_loc5_ != 0)
         {
            for each(_loc6_ in this.§_-hc§.§_-n4§().objects)
            {
               if(_loc6_.id == _loc5_)
               {
                  this.§_-hc§.select(_loc6_);
                  (_loc6_ as §_-T1g§).active = true;
                  break;
               }
            }
         }
         this.§_-hc§.§_-k26§.§_-7e§.visible = false;
         this.§_-hc§.§_-k26§.§_-7e§ = (this.back as DialogExtraPerkBack).buttonPrev;
         this.§_-hc§.§_-k26§.§_-7e§.addEventListener(MouseEvent.CLICK,this.§_-hc§.§_-k26§.§_-X2c§);
         this.§_-hc§.§_-k26§.§_-432§.visible = false;
         this.§_-hc§.§_-k26§.§_-432§ = (this.back as DialogExtraPerkBack).buttonNext;
         this.§_-hc§.§_-k26§.§_-432§.addEventListener(MouseEvent.CLICK,this.§_-hc§.§_-k26§.§_-X2c§);
      }
      
      private function §_-w1T§(param1:GameEvent) : void
      {
         var _loc2_:§_-T1g§ = null;
         this.§_-hc§.select(this.§_-hc§.§_-02G§);
         for each(_loc2_ in this.§_-hc§.§_-n4§().objects)
         {
            _loc2_.§_-61d§();
         }
      }
      
      private function §_-h1u§(param1:§_-h2m§) : void
      {
         if(this.§_-hc§.§_-02G§ == null)
         {
            return;
         }
         this.§_-Q1w§.text = §_-A11§.getName(this.§_-hc§.§_-02G§.id);
         this.§_-Z11§.text = §_-A11§.§_-ya§(this.§_-hc§.§_-02G§.id);
         if(this.§_-r2S§)
         {
            this.back.removeChild(this.§_-r2S§);
         }
         this.§_-r2S§ = §_-A11§.§_-51T§(this.§_-hc§.§_-02G§.id);
         this.§_-r2S§.width = this.§_-r2S§.height = 95;
         this.§_-r2S§.x = int(620 + this.§_-r2S§.width * 0.5);
         this.§_-r2S§.y = int(77 + this.§_-r2S§.height * 0.5);
         this.back.addChild(this.§_-r2S§);
         this.§_-8N§.load(this.§_-hc§.§_-02G§.id,§_-Ms§.§_-l1a§);
         var _loc2_:int = §_-P2x§.§_-c1K§(this.§_-hc§.§_-02G§.id);
         var _loc3_:int = §_-P2x§.§_-93Q§(_loc2_);
         var _loc4_:Boolean = §_-L1o§.§_-J2p§(_loc3_,§_-L1o§.§_-U1v§) && §_-L1o§.§_-J2p§(_loc2_,§_-L1o§.§_-U1v§);
         var _loc5_:Boolean = !§_-L1o§.§_-J2p§(_loc3_,§_-L1o§.§_-U1v§) && §_-L1o§.§_-J2p§(_loc2_,§_-L1o§.§_-U1v§);
         this.§_-k2v§.visible = _loc4_;
         this.buttonBuy.visible = !_loc4_;
         this.§_-62X§.visible = !_loc4_;
         if(_loc5_)
         {
            _loc2_ = _loc3_;
         }
         if(this.buttonBuy.visible)
         {
            this.buttonBuy.clear();
            this.buttonBuy.field.text = gls("Купить за {0}",§_-P2x§.getPackageCoinsPrice(_loc2_)) + " - ";
            this.buttonBuy.redraw();
            this.buttonBuy.x = 520 + int((290 - this.buttonBuy.width) * 0.5);
            §_-K1Y§.§_-P2W§(this.buttonBuy.field,"-",ImageIconCoins,0.7,0.7,-this.buttonBuy.field.x,-3,false,false);
         }
         if(this.§_-G2f§)
         {
            this.§_-G2f§.remove();
         }
         if(this.§_-62X§.visible)
         {
            if(this.§_-72l§)
            {
               this.§_-62X§.removeChild(this.§_-72l§);
            }
            this.§_-72l§ = new §_-E1M§(_loc2_);
            this.§_-72l§.x = 115;
            this.§_-72l§.y = 20;
            this.§_-62X§.addChild(this.§_-72l§);
            this.§_-G2f§ = new §_-f0§(this.§_-72l§,"<body><b><span class = \'center\'>" + §_-r1G§.span(§_-P2x§.§_-01H§(_loc2_),"green") + "</span></b><br/>" + §_-P2x§.§_-T1O§(_loc2_) + "</body>");
         }
      }
      
      private function select(param1:MouseEvent) : void
      {
         Connection.§_-e2T§(§_-u1O§.§_-vJ§,this.§_-nb§,this.§_-hc§.§_-02G§.id);
         hide();
      }
      
      private function buy(param1:MouseEvent) : void
      {
         var _loc2_:int = §_-P2x§.§_-c1K§(this.§_-hc§.§_-02G§.id);
         var _loc3_:int = §_-P2x§.§_-93Q§(_loc2_);
         if(!§_-L1o§.§_-J2p§(_loc3_,§_-L1o§.§_-U1v§) && §_-L1o§.§_-J2p§(_loc2_,§_-L1o§.§_-U1v§))
         {
            _loc2_ = _loc3_;
         }
         if(§_-P2x§.§_-ZR§(_loc2_))
         {
            Game.§_-u2z§(§_-u1O§.§_-Z2l§,§_-P2x§.getPackageCoinsPrice(_loc2_),0,Game.selfId,_loc2_);
         }
         else if(§_-L1o§.§_-02s§(§_-P2x§.§_-93Q§(_loc2_)))
         {
            Game.§_-u2z§(§_-u1O§.§_-j1U§,§_-P2x§.getPackageCoinsPrice(_loc2_),0,Game.selfId,_loc2_);
         }
         else
         {
            §_-B26§.show(_loc2_);
         }
      }
   }
}

