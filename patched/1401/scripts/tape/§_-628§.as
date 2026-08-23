package tape
{
   import §_-xm§.§_-n1a§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-vo§;
   import views.§_-F1z§;
   
   public class §_-628§ extends §_-K2k§
   {
      
      private static const §_-v2P§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,5783050,true);
      
      private static var pool:Vector.<§_-628§> = new Vector.<§_-628§>();
      
      private var photo:§_-F1z§ = null;
      
      private var §_-Uk§:§_-22V§ = null;
      
      private var §_-a1R§:int = -1;
      
      private var §_-6w§:String = "";
      
      public function §_-628§()
      {
         super();
         this.init();
         addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
      }
      
      public static function §_-11x§() : §_-628§
      {
         if(pool.length > 0)
         {
            return pool.pop();
         }
         return new §_-628§();
      }
      
      public static function §_-3h§(param1:§_-628§) : void
      {
         param1.reset();
         pool.push(param1);
      }
      
      public static function §_-F21§() : void
      {
         var _loc1_:§_-628§ = null;
         while(pool.length > 0)
         {
            _loc1_ = pool.pop();
            _loc1_.removeEventListener(MouseEvent.CLICK,_loc1_.§_-P2v§);
         }
      }
      
      public function get clanId() : int
      {
         return this.§_-a1R§;
      }
      
      public function §_-Ra§(param1:int, param2:String, param3:String = "") : void
      {
         this.§_-a1R§ = param1;
         this.§_-6w§ = param2;
         §_-vo§.§_-A2B§(this.§_-Uk§,param2,200,true,true,param1);
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
         this.photo = new §_-F1z§("",10,5,36);
         addChild(this.photo);
         this.§_-Uk§ = new §_-22V§("",55,13,§_-v2P§);
         addChild(this.§_-Uk§);
      }
      
      private function reset() : void
      {
         this.§_-a1R§ = -1;
         this.§_-6w§ = "";
         this.§_-Uk§.text = "";
         this.photo.load("");
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         §_-n1a§.show(this.§_-a1R§);
      }
   }
}

