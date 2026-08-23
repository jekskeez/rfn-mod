package §_-q24§
{
   import §_-X1k§.§_-93H§;
   import §_-X1k§.§_-OG§;
   import §_-X1k§.§_-n1C§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.text.TextFormat;
   import protocol.§_-u1O§;
   import tape.§_-2n§;
   import tape.§_-S1M§;
   import tape.§_-h2f§;
   import utils.§_-K1Y§;
   
   public class §_-23e§ extends §_-S1M§
   {
      
      private static const TEXT_FORMAT:TextFormat = new TextFormat(§_-i5§.§_-c10§,13,10457458,true);
      
      private static var _instance:§_-23e§ = null;
      
      public var §_-N2m§:§_-i5§ = null;
      
      public var §_-73F§:§_-i5§ = null;
      
      public var §_-g1V§:§_-i5§ = null;
      
      private var preview:Loader = null;
      
      private var §_-t1v§:§_-K2G§ = null;
      
      private var §_-K1a§:§_-K2G§ = null;
      
      private var §_-22z§:§_-i5§ = null;
      
      private var §_-9o§:§_-i5§ = null;
      
      private var §_-Yw§:MovieClip = null;
      
      private var §_-N1C§:int = 0;
      
      public function §_-23e§()
      {
         super(4,3,22.5,65,15,15,110,115,true,true,false);
         _instance = this;
      }
      
      override public function setData(param1:§_-h2f§) : void
      {
         super.setData(param1);
         if(param1.objects.length != 0)
         {
            select(param1.objects[0] as §_-2n§);
         }
         else
         {
            select(null);
         }
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-Yw§ = new MoviePreload();
         this.§_-Yw§.x = 691;
         this.§_-Yw§.y = 161;
         addChild(this.§_-Yw§);
         addChildAt(new ImageShopCastBack(),0);
         this.§_-t1v§ = new §_-K2G§("",71,14,this.§_-B2q§);
         this.§_-t1v§.y = 438;
         addChild(this.§_-t1v§);
         this.§_-K1a§ = new §_-K2G§("",71,14,this.§_-UH§);
         this.§_-K1a§.y = 438;
         addChild(this.§_-K1a§);
         this.§_-22z§ = new §_-i5§("1" + gls(" шт."),0,415,TEXT_FORMAT);
         addChild(this.§_-22z§);
         this.§_-9o§ = new §_-i5§("10" + gls(" шт."),0,415,TEXT_FORMAT);
         addChild(this.§_-9o§);
         this.preview = new Loader();
         this.preview.scrollRect = new Rectangle(0,0,150,150);
         this.preview.x = 632;
         this.preview.y = 106;
         this.preview.addEventListener(Event.COMPLETE,this.§_-Q2k§);
         this.preview.addEventListener(IOErrorEvent.IO_ERROR,this.§_-R4§);
         addChild(this.preview);
         this.§_-N2m§ = new §_-i5§("",558,49,new TextFormat(§_-i5§.§_-p1s§,20,6697728,false,null,null,null,null,"center"),292);
         addChild(this.§_-N2m§);
         this.§_-g1V§ = new §_-i5§("",560,320,new TextFormat(§_-i5§.§_-c10§,12,10457458,false),292);
         addChild(this.§_-g1V§);
         this.§_-73F§ = new §_-i5§("",560,308,new TextFormat(§_-i5§.§_-c10§,12,6829595,false),292);
         addChild(this.§_-73F§);
         §_-OG§.addEventListener(GameEvent.ITEMS_CHANGED,this.§_-TX§);
      }
      
      override protected function §_-11q§(param1:§_-2n§) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.§_-N1C§ = param1.id;
         if(this.preview.numChildren != 0)
         {
            this.preview.unloadAndStop();
         }
         this.preview.load(new URLRequest(§_-Zy§.§_-OF§ + §_-n1C§.§_-Q2U§(this.§_-N1C§) + ".swf"));
         this.§_-t1v§.field.text = this.nuts.toString() + " - ";
         this.§_-t1v§.clear();
         this.§_-t1v§.redraw();
         §_-K1Y§.§_-P2W§(this.§_-t1v§.field,"-",ImageIconNut,0.7,0.7,-this.§_-t1v§.field.x,-3,false,true);
         this.§_-t1v§.visible = this.§_-22z§.visible = this.nuts > 0;
         this.§_-t1v§.x = this.nuts > 0 ? 593 : 668;
         this.§_-22z§.x = this.§_-t1v§.x + (this.§_-t1v§.width - this.§_-22z§.width) * 0.5;
         this.§_-K1a§.field.text = this.coins.toString() + " - ";
         this.§_-K1a§.clear();
         this.§_-K1a§.redraw();
         §_-K1Y§.§_-P2W§(this.§_-K1a§.field,"-",ImageIconCoins,0.7,0.7,-this.§_-K1a§.field.x,-3,false,true);
         this.§_-K1a§.visible = this.§_-9o§.visible = this.coins > 0;
         this.§_-K1a§.x = this.coins > 0 ? 738 : 668;
         this.§_-9o§.x = this.§_-K1a§.x + (this.§_-K1a§.width - this.§_-9o§.width) * 0.5;
         this.§_-N2m§.text = §_-n1C§.§_-3f§(param1.id);
         this.§_-73F§.text = §_-n1C§.§_-c1Z§(param1.id);
         var _loc2_:String = gls("В наличии: ");
         this.§_-g1V§.text = _loc2_ + §_-OG§.§_-S2c§(param1.id) + gls(" шт.");
         this.§_-g1V§.setTextFormat(new TextFormat(§_-i5§.§_-c10§,12,16733719,true),_loc2_.length,this.§_-g1V§.text.length);
         this.§_-g1V§.y = this.§_-73F§.y + this.§_-73F§.height + 20;
      }
      
      protected function get coins() : int
      {
         return §_-93H§.§_-g1T§(this.§_-N1C§);
      }
      
      protected function get nuts() : int
      {
         return §_-93H§.§_-m2N§(this.§_-N1C§);
      }
      
      private function §_-UH§(param1:Event) : void
      {
         Game.§_-u2z§(§_-u1O§.§_-kL§,this.coins,0,Game.selfId,this.§_-N1C§);
      }
      
      private function §_-B2q§(param1:Event) : void
      {
         Game.§_-u2z§(§_-u1O§.§_-B2h§,0,this.nuts,Game.selfId,this.§_-N1C§);
      }
      
      private function §_-R4§(param1:IOErrorEvent) : void
      {
         §_-p2U§.add("Error load cast preview file");
      }
      
      private function §_-Q2k§(param1:Event) : void
      {
         this.§_-Yw§.visible = false;
      }
      
      private function §_-TX§(param1:GameEvent) : void
      {
         this.§_-11q§(this.§_-02G§);
      }
   }
}

