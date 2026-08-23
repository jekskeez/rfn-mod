package tape
{
   import §_-I18§.§_-Tw§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-L2J§;
   import views.§_-236§;
   
   public class §_-b2T§ extends §_-QN§
   {
      
      private static const §_-M2J§:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,5783050,true);
      
      private static var pool:Vector.<§_-b2T§> = new Vector.<§_-b2T§>();
      
      private var photo:§_-236§ = null;
      
      private var §_-N2m§:§_-i5§ = null;
      
      private var §_-Jx§:int = -1;
      
      private var §_-g1F§:String = "";
      
      public function §_-b2T§()
      {
         super();
         this.init();
         addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
      }
      
      public static function §_-11t§() : §_-b2T§
      {
         if(pool.length > 0)
         {
            return pool.pop();
         }
         return new §_-b2T§();
      }
      
      public static function §_-b3§(param1:§_-b2T§) : void
      {
         param1.reset();
         pool.push(param1);
      }
      
      public static function §_-4T§() : void
      {
         var _loc1_:§_-b2T§ = null;
         while(pool.length > 0)
         {
            _loc1_ = pool.pop();
            _loc1_.removeEventListener(MouseEvent.CLICK,_loc1_.§_-H1h§);
         }
      }
      
      public function get clanId() : int
      {
         return this.§_-Jx§;
      }
      
      public function §_-4j§(param1:int, param2:String, param3:String = "") : void
      {
         this.§_-Jx§ = param1;
         this.§_-g1F§ = param2;
         §_-L2J§.§_-CS§(this.§_-N2m§,param2,200,true,true,param1);
         if(param3 != "")
         {
            this.photo.load(param3);
         }
      }
      
      private function init() : void
      {
         this.graphics.beginFill(16777215);
         this.graphics.drawRoundRectComplex(0,0,294,45,5,5,5,5);
         this.graphics.endFill();
         this.buttonMode = true;
         this.photo = new §_-236§("",10,5,36);
         addChild(this.photo);
         this.§_-N2m§ = new §_-i5§("",55,13,§_-M2J§);
         addChild(this.§_-N2m§);
      }
      
      private function reset() : void
      {
         this.§_-Jx§ = -1;
         this.§_-g1F§ = "";
         this.§_-N2m§.text = "";
         this.photo.load("");
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         §_-Tw§.show(this.§_-Jx§);
      }
   }
}

