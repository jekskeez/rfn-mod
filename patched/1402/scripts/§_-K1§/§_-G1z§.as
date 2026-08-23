package §_-K1§
{
   import §_-J19§.§_-534§;
   import §_-J21§.§_-M1l§;
   import §_-J21§.§_-Q1j§;
   import §_-Qy§.§_-Ms§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-a11§.§_-h2m§;
   import §_-bN§.Dialog;
   import §_-q24§.§_-o1A§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import tape.§_-2n§;
   import tape.§_-L2v§;
   import tape.§_-QN§;
   import tape.§_-S1M§;
   import tape.§_-h2f§;
   import tape.§_-o2N§;
   
   public class §_-G1z§ extends Sprite
   {
      
      private static const §_-W2P§:TextFormat = new TextFormat(null,12,6829595);
      
      private var §_-n2x§:int = -1;
      
      private var §_-ub§:int = -1;
      
      private var §_-xk§:§_-P2I§ = null;
      
      private var §_-Y1T§:§_-i5§ = null;
      
      private var §_-Z11§:§_-i5§ = null;
      
      private var §_-tz§:§_-q1m§ = null;
      
      private var §_-eO§:§_-S1M§ = null;
      
      private var §_-hc§:§_-L2v§ = null;
      
      private var §_-Ib§:DisplayObject = null;
      
      private var preview:§_-Ms§ = null;
      
      private var back:ImageShopDetailsCaption = null;
      
      public function §_-G1z§(param1:int)
      {
         super();
         this.§_-n2x§ = param1;
         this.§_-ub§ = §_-P2x§.§_-y18§(this.id)[0];
         this.init();
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      public function §_-6e§(param1:int) : void
      {
         var _loc2_:Vector.<§_-QN§> = this.§_-eO§.§_-n4§().objects;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if((_loc2_[_loc3_] as §_-2n§).id == param1)
            {
               this.§_-eO§.select(_loc2_[_loc3_] as §_-2n§);
               return;
            }
            _loc3_++;
         }
      }
      
      private function init() : void
      {
         this.back = new ImageShopDetailsCaption();
         this.back.buttonBack.addEventListener(MouseEvent.CLICK,this.§_-M1w§);
         addChild(this.back);
         this.preview = new §_-Ms§();
         this.preview.load(this.§_-ub§);
         this.preview.x = 716;
         this.preview.y = 353;
         this.preview.scaleX = this.preview.scaleY = 0.8;
         addChild(this.preview);
         var _loc1_:§_-i5§ = new §_-i5§(§_-P2x§.§_-01H§(§_-P2x§.§_-y18§(this.id)[0]),0,18,new TextFormat(§_-i5§.§_-p1s§,24,16777215));
         _loc1_.filters = §_-K1H§.§_-q2I§;
         _loc1_.x = 440 - int(_loc1_.width * 0.5);
         addChild(_loc1_);
         this.§_-xk§ = new §_-P2I§(this.id,true);
         this.§_-xk§.x = 15;
         this.§_-xk§.y = 85;
         this.§_-xk§.buttonMode = true;
         this.§_-xk§.addEventListener(MouseEvent.CLICK,this.§_-71s§);
         addChild(this.§_-xk§);
         this.§_-Y1T§ = new §_-i5§("",250,348,Dialog.FORMAT_CAPTION_16);
         this.§_-Y1T§.filters = Dialog.§_-q2I§;
         addChild(this.§_-Y1T§);
         this.§_-Z11§ = new §_-i5§("",250,370,§_-W2P§,420);
         addChild(this.§_-Z11§);
         this.§_-tz§ = new §_-q1m§();
         this.§_-tz§.x = 270;
         this.§_-tz§.y = 445;
         addChild(this.§_-tz§);
         this.§_-eO§ = new §_-S1M§(3,1,5,12,10,0,195,220,true,false,true);
         this.§_-eO§.x = 250;
         this.§_-eO§.y = 72;
         var _loc2_:§_-o2N§ = new §_-o2N§(§_-o1A§);
         var _loc3_:Array = §_-P2x§.§_-y18§(this.id).slice(1);
         _loc2_.setData(_loc3_.filter(§_-P2x§.§_-1b§));
         this.§_-eO§.setData(_loc2_);
         this.§_-eO§.addEventListener(§_-h2m§.SELECTED,this.§_-h1u§);
         addChild(this.§_-eO§);
         this.§_-Ib§ = new ImageShopEmptyClothes();
         this.§_-Ib§.x = 238;
         this.§_-Ib§.y = 100;
         this.§_-Ib§.visible = this.§_-eO§.§_-n4§().objects.length == 0;
         addChild(this.§_-Ib§);
         _loc1_ = new §_-i5§(gls("Магия костюма"),0,520,new TextFormat(§_-i5§.§_-p1s§,15,16777215));
         _loc1_.x = 120 - int(_loc1_.textWidth * 0.5);
         _loc1_.filters = [new GlowFilter(1994910,1,4,4,8)];
         addChild(_loc1_);
         this.§_-hc§ = new §_-L2v§(int.MAX_VALUE,1,0,0,10,0,50,50);
         var _loc4_:§_-h2f§ = new §_-h2f§(§_-Q1j§);
         _loc4_.setData(§_-P2x§.§_-T§(this.id).filter(§_-P2x§.§_-y2T§));
         var _loc5_:Array = §_-P2x§.§_-DA§(this.id);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            if(§_-L1o§.§_-J2p§(_loc5_[_loc6_],§_-L1o§.§_-U1v§))
            {
               _loc4_.addObject(new §_-M1l§(_loc5_[_loc6_]));
            }
            _loc6_++;
         }
         this.§_-hc§.setData(_loc4_);
         this.§_-hc§.x = 250;
         this.§_-hc§.y = 513;
         this.§_-hc§.scaleX = this.§_-hc§.scaleY = 0.8;
         addChild(this.§_-hc§);
         this.§_-eO§.§_-W2w§();
      }
      
      private function §_-M1w§(param1:MouseEvent) : void
      {
         §_-534§.§_-C2M§();
      }
      
      private function §_-71s§(param1:MouseEvent) : void
      {
         this.§_-eO§.§_-W2w§();
      }
      
      private function §_-h1u§(param1:§_-h2m§) : void
      {
         if(this.§_-eO§.§_-02G§ != null)
         {
            this.§_-ub§ = this.§_-eO§.§_-02G§.id;
         }
         else
         {
            this.§_-ub§ = §_-P2x§.§_-y18§(this.id)[0];
         }
         this.update();
      }
      
      private function update() : void
      {
         this.§_-Y1T§.text = §_-P2x§.§_-01H§(this.§_-ub§);
         this.§_-Z11§.htmlText = §_-P2x§.§_-T1O§(this.§_-ub§);
         this.preview.load(§_-P2x§.§_-9c§(this.§_-ub§),§_-P2x§.§_-VD§(this.§_-ub§));
         if(§_-P2x§.§_-G1S§(this.§_-ub§).length > 0)
         {
            this.§_-tz§.id = §_-P2x§.§_-G1S§(this.§_-ub§)[0];
         }
         this.§_-tz§.visible = §_-P2x§.§_-G1S§(this.§_-ub§).length > 0;
         this.§_-xk§.selected = this.§_-eO§.§_-02G§ == null;
      }
   }
}

