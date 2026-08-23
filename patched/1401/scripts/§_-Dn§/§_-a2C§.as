package §_-Dn§
{
   import §_-42B§.TweenMax;
   import §_-RI§.§_-v2j§;
   import §_-sk§.TextField;
   import flash.geom.Point;
   import starling.display.Sprite;
   import starling.filters.BlurFilter;
   import utils.§_-23z§;
   
   public class §_-a2C§ extends Sprite
   {
      
      private const §_-b23§:BlurFilter = BlurFilter.§_-q2e§(16777113,1,0.5,1);
      
      private const FIELD:TextField = new TextField(180,20,"",§_-22V§.§_-F2z§,20,16271104,true);
      
      private var tween:TweenMax = null;
      
      public function §_-a2C§(param1:String, param2:§_-v2j§, param3:int, param4:int)
      {
         super();
         this.x = param3;
         this.y = param4;
         this.FIELD.x = -90;
         this.FIELD.leading = -4;
         this.FIELD.text = param1;
         this.FIELD.filter = this.§_-b23§;
         addChild(this.FIELD);
         var _loc5_:§_-23z§ = new §_-23z§(this.FIELD,new Point(90,this.FIELD.height));
         _loc5_.rotation = 19.5;
         param2.§_-83v§(this);
         this.§_-83n§();
      }
      
      private function §_-83n§() : void
      {
         var dstX:int = this.FIELD.x + 30;
         var dstY:int = this.FIELD.y - 50;
         this.tween = TweenMax.to(this.FIELD,0.9,{
            "x":dstX,
            "y":dstY,
            "onComplete":function():void
            {
               tween = TweenMax.to(FIELD,0.5,{
                  "alpha":0,
                  "onComplete":dispose
               });
            }
         });
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.tween != null)
         {
            this.tween.§_-h2r§();
         }
         this.tween = null;
         removeFromParent();
      }
   }
}

