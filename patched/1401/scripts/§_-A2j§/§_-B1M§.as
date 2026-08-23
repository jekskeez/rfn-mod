package §_-A2j§
{
   import §_-I10§.§_-8S§;
   import §_-I10§.§_-B3s§;
   import §_-I10§.§_-X2T§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.text.TextFormat;
   import protocol.§_-h2B§;
   import tape.§_-A3s§;
   import tape.§_-wP§;
   import tape.§_-xc§;
   import utils.§_-jB§;
   
   public class §_-B1M§ extends §_-wP§
   {
      
      private static const TEXT_FORMAT:TextFormat = new TextFormat(§_-22V§.§_-F2z§,13,10457458,true);
      
      private static var _instance:§_-B1M§ = null;
      
      public var §_-Uk§:§_-22V§ = null;
      
      public var §_-P1z§:§_-22V§ = null;
      
      public var §_-m16§:§_-22V§ = null;
      
      private var preview:Loader = null;
      
      private var §_-Ak§:§_-j18§ = null;
      
      private var §_-31z§:§_-j18§ = null;
      
      private var §_-qz§:§_-22V§ = null;
      
      private var §_-Fk§:§_-22V§ = null;
      
      private var §_-821§:MovieClip = null;
      
      private var §_-w2L§:int = 0;
      
      public function §_-B1M§()
      {
         super(4,3,22.5,65,15,15,110,115,true,true,false);
         _instance = this;
      }
      
      override public function setData(param1:§_-xc§) : void
      {
         super.setData(param1);
         if(param1.objects.length != 0)
         {
            select(param1.objects[0] as §_-A3s§);
         }
         else
         {
            select(null);
         }
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-821§ = new MoviePreload();
         this.§_-821§.x = 691;
         this.§_-821§.y = 161;
         addChild(this.§_-821§);
         addChildAt(new ImageShopCastBack(),0);
         this.§_-Ak§ = new §_-j18§("",71,14,this.§_-z1Q§);
         this.§_-Ak§.y = 438;
         addChild(this.§_-Ak§);
         this.§_-31z§ = new §_-j18§("",71,14,this.§_-4l§);
         this.§_-31z§.y = 438;
         addChild(this.§_-31z§);
         this.§_-qz§ = new §_-22V§("1" + gls(" шт."),0,415,TEXT_FORMAT);
         addChild(this.§_-qz§);
         this.§_-Fk§ = new §_-22V§("10" + gls(" шт."),0,415,TEXT_FORMAT);
         addChild(this.§_-Fk§);
         this.preview = new Loader();
         this.preview.scrollRect = new Rectangle(0,0,150,150);
         this.preview.x = 632;
         this.preview.y = 106;
         this.preview.addEventListener(Event.COMPLETE,this.§_-53I§);
         this.preview.addEventListener(IOErrorEvent.IO_ERROR,this.§_-VL§);
         addChild(this.preview);
         this.§_-Uk§ = new §_-22V§("",558,49,new TextFormat(§_-22V§.§_-pJ§,20,6697728,false,null,null,null,null,"center"),292);
         addChild(this.§_-Uk§);
         this.§_-m16§ = new §_-22V§("",560,320,new TextFormat(§_-22V§.§_-F2z§,12,10457458,false),292);
         addChild(this.§_-m16§);
         this.§_-P1z§ = new §_-22V§("",560,308,new TextFormat(§_-22V§.§_-F2z§,12,6829595,false),292);
         addChild(this.§_-P1z§);
         §_-B3s§.addEventListener(GameEvent.ITEMS_CHANGED,this.§_-U29§);
      }
      
      override protected function §_-x2k§(param1:§_-A3s§) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.§_-w2L§ = param1.id;
         if(this.preview.numChildren != 0)
         {
            this.preview.unloadAndStop();
         }
         this.preview.load(new URLRequest(§_-a9§.§_-E2P§ + §_-X2T§.§_-y7§(this.§_-w2L§) + ".swf"));
         this.§_-Ak§.field.text = this.nuts.toString() + " - ";
         this.§_-Ak§.clear();
         this.§_-Ak§.redraw();
         §_-jB§.§_-fG§(this.§_-Ak§.field,"-",ImageIconNut,0.7,0.7,-this.§_-Ak§.field.x,-3,false,true);
         this.§_-Ak§.visible = this.§_-qz§.visible = this.nuts > 0;
         this.§_-Ak§.x = this.nuts > 0 ? 593 : 668;
         this.§_-qz§.x = this.§_-Ak§.x + (this.§_-Ak§.width - this.§_-qz§.width) * 0.5;
         this.§_-31z§.field.text = this.coins.toString() + " - ";
         this.§_-31z§.clear();
         this.§_-31z§.redraw();
         §_-jB§.§_-fG§(this.§_-31z§.field,"-",ImageIconCoins,0.7,0.7,-this.§_-31z§.field.x,-3,false,true);
         this.§_-31z§.visible = this.§_-Fk§.visible = this.coins > 0;
         this.§_-31z§.x = this.coins > 0 ? 738 : 668;
         this.§_-Fk§.x = this.§_-31z§.x + (this.§_-31z§.width - this.§_-Fk§.width) * 0.5;
         this.§_-Uk§.text = §_-X2T§.§_-bh§(param1.id);
         this.§_-P1z§.text = §_-X2T§.§_-33M§(param1.id);
         var _loc2_:String = gls("В наличии: ");
         this.§_-m16§.text = _loc2_ + §_-B3s§.§_-2C§(param1.id) + gls(" шт.");
         this.§_-m16§.setTextFormat(new TextFormat(§_-22V§.§_-F2z§,12,16733719,true),_loc2_.length,this.§_-m16§.text.length);
         this.§_-m16§.y = this.§_-P1z§.y + this.§_-P1z§.height + 20;
      }
      
      protected function get coins() : int
      {
         return §_-8S§.§_-A1d§(this.§_-w2L§);
      }
      
      protected function get nuts() : int
      {
         return §_-8S§.§_-D2a§(this.§_-w2L§);
      }
      
      private function §_-4l§(param1:Event) : void
      {
         Game.§_-K2t§(§_-h2B§.§_-c1I§,this.coins,0,Game.selfId,this.§_-w2L§);
      }
      
      private function §_-z1Q§(param1:Event) : void
      {
         Game.§_-K2t§(§_-h2B§.§_-z2H§,0,this.nuts,Game.selfId,this.§_-w2L§);
      }
      
      private function §_-VL§(param1:IOErrorEvent) : void
      {
         §_-TQ§.add("Error load cast preview file");
      }
      
      private function §_-53I§(param1:Event) : void
      {
         this.§_-821§.visible = false;
      }
      
      private function §_-U29§(param1:GameEvent) : void
      {
         this.§_-x2k§(this.§_-Y1y§);
      }
   }
}

