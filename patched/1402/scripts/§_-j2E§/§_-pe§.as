package §_-j2E§
{
   import §_-8Q§.GameBody;
   import §_-I1q§.§_-g1J§;
   import §_-p2L§.§_-j1k§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-pe§ extends §_-j1k§
   {
      
      private var view:MovieClip;
      
      public function §_-pe§(param1:Hero)
      {
         super(param1);
         this.§_-S2A§ = "PerkEasterChicken";
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
         this.view.addEventListener(Event.COMPLETE,this.§_-w1T§);
         this.hero.heroView.addChild(this.view);
         super.activate();
      }
      
      override protected function §_-6u§(param1:GameBody) : void
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
         (castObject as §_-g1J§).points = points;
         castObject.playerId = this.hero.id;
      }
      
      override protected function get §_-L2b§() : Class
      {
         return §_-g1J§;
      }
      
      private function §_-w1T§(param1:Event = null) : void
      {
         if(Boolean(this.view) && Boolean(this.view.parent))
         {
            this.view.removeEventListener(Event.COMPLETE,this.§_-w1T§);
            this.view.parent.removeChild(this.view);
         }
         this.view = null;
      }
   }
}

