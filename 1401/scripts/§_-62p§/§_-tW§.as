package §_-62p§
{
   import §_-A2j§.§_-I1k§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-d10§.§_-e1N§;
   import §_-k1c§.Dialog;
   import §_-r2Y§.§_-33e§;
   import §_-s2u§.§_-IU§;
   import §_-s2u§.§_-l2n§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   import tape.§_-3l§;
   import tape.§_-91w§;
   import tape.§_-A3s§;
   import tape.§_-K2k§;
   import tape.§_-wP§;
   import tape.§_-xc§;
   
   public class §_-tW§ extends Sprite
   {
      
      private static const §_-i2c§:TextFormat = new TextFormat(null,12,6829595);
      
      private var §_-4A§:int = -1;
      
      private var §_-D27§:int = -1;
      
      private var §_-B2K§:§_-F18§ = null;
      
      private var §_-zl§:§_-22V§ = null;
      
      private var §_-n2P§:§_-22V§ = null;
      
      private var §_-c4§:§_-S2b§ = null;
      
      private var §_-91d§:§_-wP§ = null;
      
      private var §_-gR§:§_-3l§ = null;
      
      private var §_-Q22§:DisplayObject = null;
      
      private var preview:§_-e1N§ = null;
      
      private var back:ImageShopDetailsCaption = null;
      
      public function §_-tW§(param1:int)
      {
         super();
         this.§_-4A§ = param1;
         this.§_-D27§ = §_-g2W§.§_-W2m§(this.id)[0];
         this.init();
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      public function §_-g2Z§(param1:int) : void
      {
         var _loc2_:Vector.<§_-K2k§> = this.§_-91d§.§_-H1Q§().objects;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if((_loc2_[_loc3_] as §_-A3s§).id == param1)
            {
               this.§_-91d§.select(_loc2_[_loc3_] as §_-A3s§);
               return;
            }
            _loc3_++;
         }
      }
      
      private function init() : void
      {
         this.back = new ImageShopDetailsCaption();
         this.back.buttonBack.addEventListener(MouseEvent.CLICK,this.§_-j1D§);
         addChild(this.back);
         this.preview = new §_-e1N§();
         this.preview.load(this.§_-D27§);
         this.preview.x = 716;
         this.preview.y = 353;
         this.preview.scaleX = this.preview.scaleY = 0.8;
         addChild(this.preview);
         var _loc1_:§_-22V§ = new §_-22V§(§_-g2W§.§_-G1Y§(§_-g2W§.§_-W2m§(this.id)[0]),0,18,new TextFormat(§_-22V§.§_-pJ§,24,16777215));
         _loc1_.filters = §_-BZ§.§_-m2A§;
         _loc1_.x = 440 - int(_loc1_.width * 0.5);
         addChild(_loc1_);
         this.§_-B2K§ = new §_-F18§(this.id,true);
         this.§_-B2K§.x = 15;
         this.§_-B2K§.y = 85;
         this.§_-B2K§.buttonMode = true;
         this.§_-B2K§.addEventListener(MouseEvent.CLICK,this.§_-y3§);
         addChild(this.§_-B2K§);
         this.§_-zl§ = new §_-22V§("",250,348,Dialog.FORMAT_CAPTION_16);
         this.§_-zl§.filters = Dialog.§_-m2A§;
         addChild(this.§_-zl§);
         this.§_-n2P§ = new §_-22V§("",250,370,§_-i2c§,420);
         addChild(this.§_-n2P§);
         this.§_-c4§ = new §_-S2b§();
         this.§_-c4§.x = 270;
         this.§_-c4§.y = 445;
         addChild(this.§_-c4§);
         this.§_-91d§ = new §_-wP§(3,1,5,12,10,0,195,220,true,false,true);
         this.§_-91d§.x = 250;
         this.§_-91d§.y = 72;
         var _loc2_:§_-91w§ = new §_-91w§(§_-I1k§);
         var _loc3_:Array = §_-g2W§.§_-W2m§(this.id).slice(1);
         _loc2_.setData(_loc3_.filter(§_-g2W§.§_-SB§));
         this.§_-91d§.setData(_loc2_);
         this.§_-91d§.addEventListener(§_-33e§.SELECTED,this.§_-91N§);
         addChild(this.§_-91d§);
         this.§_-Q22§ = new ImageShopEmptyClothes();
         this.§_-Q22§.x = 238;
         this.§_-Q22§.y = 100;
         this.§_-Q22§.visible = this.§_-91d§.§_-H1Q§().objects.length == 0;
         addChild(this.§_-Q22§);
         _loc1_ = new §_-22V§(gls("Магия костюма"),0,520,new TextFormat(§_-22V§.§_-pJ§,15,16777215));
         _loc1_.x = 120 - int(_loc1_.textWidth * 0.5);
         _loc1_.filters = [new GlowFilter(1994910,1,4,4,8)];
         addChild(_loc1_);
         this.§_-gR§ = new §_-3l§(int.MAX_VALUE,1,0,0,10,0,50,50);
         var _loc4_:§_-xc§ = new §_-xc§(§_-l2n§);
         _loc4_.setData(§_-g2W§.§_-433§(this.id).filter(§_-g2W§.§_-42y§));
         var _loc5_:Array = §_-g2W§.§_-H2J§(this.id);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            if(§_-h1f§.§_-i21§(_loc5_[_loc6_],§_-h1f§.§_-A3r§))
            {
               _loc4_.addObject(new §_-IU§(_loc5_[_loc6_]));
            }
            _loc6_++;
         }
         this.§_-gR§.setData(_loc4_);
         this.§_-gR§.x = 250;
         this.§_-gR§.y = 513;
         this.§_-gR§.scaleX = this.§_-gR§.scaleY = 0.8;
         addChild(this.§_-gR§);
         this.§_-91d§.§_-51b§();
      }
      
      private function §_-j1D§(param1:MouseEvent) : void
      {
         §_-m1L§.§_-k1k§();
      }
      
      private function §_-y3§(param1:MouseEvent) : void
      {
         this.§_-91d§.§_-51b§();
      }
      
      private function §_-91N§(param1:§_-33e§) : void
      {
         if(this.§_-91d§.§_-Y1y§ != null)
         {
            this.§_-D27§ = this.§_-91d§.§_-Y1y§.id;
         }
         else
         {
            this.§_-D27§ = §_-g2W§.§_-W2m§(this.id)[0];
         }
         this.update();
      }
      
      private function update() : void
      {
         this.§_-zl§.text = §_-g2W§.§_-G1Y§(this.§_-D27§);
         this.§_-n2P§.htmlText = §_-g2W§.§_-81F§(this.§_-D27§);
         this.preview.load(§_-g2W§.§_-Kc§(this.§_-D27§),§_-g2W§.§_-z1V§(this.§_-D27§));
         if(§_-g2W§.§_-w2o§(this.§_-D27§).length > 0)
         {
            this.§_-c4§.id = §_-g2W§.§_-w2o§(this.§_-D27§)[0];
         }
         this.§_-c4§.visible = §_-g2W§.§_-w2o§(this.§_-D27§).length > 0;
         this.§_-B2K§.selected = this.§_-91d§.§_-Y1y§ == null;
      }
   }
}

