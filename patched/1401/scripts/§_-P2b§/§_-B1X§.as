package §_-P2b§
{
   import §_-83V§.GameBody;
   import §_-A3e§.§_-C1§;
   import §_-u2r§.§_-W23§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-B1X§ extends §_-C1§
   {
      
      private var view:MovieClip;
      
      public function §_-B1X§(param1:Hero)
      {
         super(param1);
         this.§_-it§ = "PerkEasterChicken";
      }
      
      override public function get totalCooldown() : Number
      {
         return 15;
      }
      
      override public function get maxCountUse() : int
      {
         return 3;
      }
      
      override protected function activate() : void
      {
         this.view = new EasterChickenCreate();
         this.view.addEventListener(Event.COMPLETE,this.§_-Hp§);
         this.hero.heroView.addChild(this.view);
         super.activate();
      }
      
      override protected function §_-92Z§(param1:GameBody) : void
      {
         var j:int = 0;
         var castObject:GameBody = param1;
         var size:Point = this.hero.game.map.size;
         var points:Array = [];
         var i:int = 0;
         while(i < 3)
         {
            j = 0;
            while(j < 2)
            {
               points.push(new Point(size.x * (i + Math.random()) / 3,size.y * (j + Math.random()) * 0.5));
               j++;
            }
            i++;
         }
         points.sort(function(param1:Point, param2:Point):int
         {
            return Math.sin(param1.x) > Math.sin(param2.x) ? 1 : -1;
         });
         castObject.position = this.hero.position.Copy();
         (castObject as §_-W23§).points = points;
         castObject.playerId = this.hero.id;
      }
      
      override protected function get §_-l1R§() : Class
      {
         return §_-W23§;
      }
      
      private function §_-Hp§(param1:Event = null) : void
      {
         if(Boolean(this.view) && Boolean(this.view.parent))
         {
            this.view.removeEventListener(Event.COMPLETE,this.§_-Hp§);
            this.view.parent.removeChild(this.view);
         }
         this.view = null;
      }
   }
}

