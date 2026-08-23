package §_-y1V§
{
   import §_-22D§.TweenMax;
   import §_-TK§.§_-51g§;
   import §_-b5§.TextField;
   import flash.geom.Point;
   import starling.display.Sprite;
   import starling.filters.BlurFilter;
   import utils.§_-L14§;
   
   public class §_-W12§ extends Sprite
   {
      
      private const §_-21n§:BlurFilter = BlurFilter.§_-J23§(16777113,1,0.5,1);
      
      private const FIELD:TextField = new TextField(180,20,"",§_-i5§.§_-c10§,20,16271104,true);
      
      private var tween:TweenMax = null;
      
      public function §_-W12§(param1:String, param2:§_-51g§, param3:int, param4:int)
      {
         super();
         this.x = param3;
         this.y = param4;
         this.FIELD.x = -90;
         this.FIELD.leading = -4;
         this.FIELD.text = param1;
         this.FIELD.filter = this.§_-21n§;
         addChild(this.FIELD);
         var _loc5_:§_-L14§ = new §_-L14§(this.FIELD,new Point(90,this.FIELD.height));
         _loc5_.rotation = 19.5;
         param2.§_-J2J§(this);
         this.§_-w25§();
      }
      
      private function §_-w25§() : void
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
            this.tween.§_-kl§();
         }
         this.tween = null;
         removeFromParent();
      }
   }
}

